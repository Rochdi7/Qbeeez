import stripe
import uuid
import json

from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.conf import settings
from django.views.generic.base import TemplateView
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from .models import Invoice, Facture, Payment, SalesPointFacture
from course.models import Program
from .forms import FactureForm
import gopay
from gopay.enums import PaymentInstrument, BankSwiftCode, Currency, Language

User = get_user_model()  # Get the user mode

def pos_submit(request):
    if request.method == 'POST':
        user_id = request.POST.get('user_id')
        program_id = request.POST.get('program_id')
        pos_code = request.POST.get('pos_code')
        document1 = request.FILES.get('student_card')  # Adjust to get the uploaded file
        status = 'Pending'  # Set the default status or derive as needed

        try:
            # Create and save the SalesPointFacture instance
            sales_point_facture = SalesPointFacture(
                user_id=user_id,
                program_id=program_id,
                pos_code=pos_code,
                document1=document1,
                status=status
            )
            sales_point_facture.save()
            return JsonResponse({'success': True, 'redirect_url': '/payments/succeed/'})  # Use the URL name for redirection
            
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})

    # If GET request, you may want to show the form or the programs
    programs = Program.objects.all()  # Fetch programs to show on the page
    context = {
        'programs': programs
    }
    return render(request, 'payments/pos_payment.html', context)  # Adjust the template name as necessary

def payment_succeed(request):
    return render(request, 'payments/payment_succeed.html', context={})

@login_required
def cihbank_payment(request):
    if request.method == "POST":
        program_id = request.POST.get('program_id')  # This retrieves the program_id from the hidden input
        document1 = request.FILES.get('document1')
        document2 = request.FILES.get('document2')

        # Create and save the Facture instance
        facture = Facture(
            user_id=request.user,
            program_id_id=program_id,  # Use program_id_id to store the selected program
            document1=document1,
            document2=document2
        )
        facture.save()

        # Redirect to a success page
        return redirect('payment_succeed')
    else:
        # Return the context with programs for the GET request
        programs = Program.objects.all()  # Fetch programs to show on the page
        context = {
            'programs': programs
        }
        return render(request, 'payments/cihbank_payment.html', context)

def sales_point_payment(request):
    programs = Program.objects.all()  # Adjust this query as necessary
    return render(request, 'payments/pos_form.html', {'programs': programs})

def create_facture(request):
    if request.method == 'POST':
        form = FactureForm(request.POST, request.FILES)
        if form.is_valid():
            facture = form.save(commit=False)
            # Retrieve the program ID from the form or request
            program_id = request.POST.get('program_id')  # Change this as necessary
            # Get the Program instance from the database
            program_instance = get_object_or_404(Program, id=program_id)
            # Assign the Program instance to facture
            facture.program_id = program_instance
            # Save the facture
            facture.save()
            return redirect('success_url')  # Replace with your actual success URL
    else:
        form = FactureForm()
    return render(request, 'your_template.html', {'form': form})

def transaction_history(request):
    factures = Facture.objects.filter(user=request.user)  # Get factures for the logged-in user
    return render(request, 'transaction_history.html', {'factures': factures})

def cihbank_payment_view(request):
    programs = Program.objects.all()  # Fetch programs to show on the page
    context = {
        'programs': programs  # Add any other context variables as needed
    }
    return render(request, 'payments/cihbank_payment.html', context)

def payment_complete_view(request):
    return render(request, 'payments/payment_complete.html')  # Adjust to your template path

def payment_paypal(request):
    return render(request, "payments/paypal.html", context={})

def payment_stripe(request):
    return render(request, "payments/stripe.html", context={})

def payment_coinbase(request):
    return render(request, "payments/coinbase.html", context={})

def payment_paylike(request):
    return render(request, "payments/paylike.html", context={})
class PaymentGetwaysView(TemplateView):
    template_name = "payments/payment_gateways.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["key"] = settings.STRIPE_PUBLISHABLE_KEY
        context["amount"] = 500
        context["description"] = "Stripe Payment"
        context["invoice_session"] = self.request.session.get("invoice_session")

        # Fetching the list of all programs
        context["programs"] = Program.objects.all()  

        user_id = self.request.user.id
        
        # Count active subscriptions from both tables
        active_abonnement_count = (
            Facture.objects.filter(user_id=user_id, status='paid').count() +
            SalesPointFacture.objects.filter(user=user_id, status='paid').count()
        )

        # Get the programs associated with the user's active subscriptions from both tables
        active_payments_facture = Facture.objects.filter(
            user_id=user_id,
            status='paid'
        ).select_related('program_id')  # Use program_id to get related Program

        active_payments_salespoint = SalesPointFacture.objects.filter(
            user=user_id,
            status='paid'
        ).select_related('program')  # This is correct

        # Combine unique programs from both active payments
        active_programs = set()  # Use a set to avoid duplicates

        # Add programs from Facture
        for payment in active_payments_facture:
            active_programs.add(payment.program_id)

        # Add programs from SalesPointFacture
        for payment in active_payments_salespoint:
            active_programs.add(payment.program)

        # Convert the set back to a list for context
        context["active_abonnement_count"] = active_abonnement_count
        context["active_programs"] = list(active_programs)

        return context





def stripe_charge(request):
    stripe.api_key = settings.STRIPE_SECRET_KEY

    if request.method == "POST":
        stripe_token = request.POST.get("stripeToken")

        if not stripe_token:
            return JsonResponse({"error": "stripeToken not provided"}, status=400)

        try:
            charge = stripe.Charge.create(
                amount=500,  # Amount in cents
                currency="eur",
                description="A Django charge",
                source=stripe_token,  # Use the token received from the form
            )

            # Retrieve the invoice code from session
            invoice_code = request.session.get("invoice_session")
            if invoice_code:
                invoice = Invoice.objects.get(invoice_code=invoice_code)
                invoice.payment_complete = True
                invoice.save()

            return redirect("payment_succeed")

        except stripe.error.StripeError as e:
            return JsonResponse({"error": str(e)}, status=400)

    return JsonResponse({"error": "Invalid request method"}, status=405)

def gopay_charge(request):
    if request.method == "POST":
        user = request.user

        payments = gopay.payments(
            {
                "goid": "[PAYMENT_ID]",
                "clientId": "[GOPAY_CLIENT_ID]",
                "clientSecret": "[GOPAY_CLIENT_SECRET]",
                "isProductionMode": False,
                "scope": gopay.TokenScope.ALL,
                "language": gopay.Language.ENGLISH,
                "timeout": 30,
            }
        )

        response = payments.create_payment(
            {
                "payer": {
                    "default_payment_instrument": PaymentInstrument.BANK_ACCOUNT,
                    "allowed_payment_instruments": [PaymentInstrument.BANK_ACCOUNT],
                    "default_swift": BankSwiftCode.FIO_BANKA,
                    "allowed_swifts": [BankSwiftCode.FIO_BANKA, BankSwiftCode.MBANK],
                    "contact": {
                        "first_name": user.first_name,
                        "last_name": user.last_name,
                        "email": user.email,
                        "phone_number": user.phone,
                        "city": "example city",
                        "street": "Plana 67",
                        "postal_code": "373 01",
                        "country_code": "CZE",
                    },
                },
                "amount": 150,
                "currency": Currency.CZECH_CROWNS,
                "order_number": "001",
                "order_description": "pojisteni01",
                "items": [
                    {"name": "item01", "amount": 50},
                    {"name": "item02", "amount": 100},
                ],
                "additional_params": [{"name": "invoicenumber", "value": "2015001003"}],
                "callback": {
                    "return_url": "http://www.your-url.tld/return",
                    "notification_url": "http://www.your-url.tld/notify",
                },
                "lang": Language.CZECH,
            }
        )

        if response.has_succeed():
            print("\nPayment Succeed\n")
            print("hooray, API returned " + str(response))
        else:
            print("\nPayment Fail\n")
            print("oops, API returned " + str(response.status_code) + ": " + str(response))

        return JsonResponse({"message": str(response)})

    return JsonResponse({"message": "GET requested"})

def paymentComplete(request):
    if request.is_ajax() or request.method == "POST":
        invoice_id = request.session["invoice_session"]
        invoice = Invoice.objects.get(id=invoice_id)
        invoice.payment_complete = True
        invoice.save()

    body = json.loads(request.body)
    print("BODY:", body)
    return JsonResponse("Payment completed!", safe=False)


def create_invoice(request):
    if request.method == "POST":
        invoice = Invoice.objects.create(
            user=request.user,
            amount=request.POST.get("amount"),
            total=26,
            invoice_code=str(uuid.uuid4()),
        )
        request.session["invoice_session"] = invoice.invoice_code
        return redirect("payment_gateways")

    return render(
        request,
        "invoices.html",
        context={"invoices": Invoice.objects.filter(user=request.user)},
    )


def invoice_detail(request, slug):
    return render(
        request,
        "invoice_detail.html",
        context={"invoice": Invoice.objects.get(invoice_code=slug)},
    )


def gopay_payment(request):
    return render(request, "payments/gopay_payment.html", context={})


def charge(request):
    return render(request, "payments/charge.html", context={})


def payment_method_view(request):
    return render(request, 'payment_method.html')


def payment_complete_view(request):
    return render(request, 'payment_complete.html')

def payment_succeed(request):
    return render(request, 'payments/payment_succeed.html', context={})


# Add the missing payment_success view
def payment_success(request):
    return render(request, 'payments/payment_success.html')  # Adjust to your template path
