from django.urls import path
from . import views
from .views import cihbank_payment  # Import the view
from .views import sales_point_payment  # Import your view function
from .views import cihbank_payment, cihbank_payment_view, payment_succeed

urlpatterns = [
    path('payments/succeed/', payment_succeed, name='payment_succeed'),
    path('succeed/', payment_succeed, name='payment_succeed'),

    path('cihbank-payment/', cihbank_payment, name='cihbank_payment'),
path('sales-point-payment/', views.sales_point_payment, name='sales_point_payment'),
    path('pos-submit/', views.pos_submit, name='pos_submit'),  # Ensure this exists    path('pos-submit/', pos_submit, name='pos_submit'),  # URL for submitting POS
    path("", views.PaymentGetwaysView.as_view(), name="payment_gateways"),
    path("paypal/", views.payment_paypal, name="paypal"),
    path("stripe/", views.payment_stripe, name="stripe"),
    path("stripe-charge/", views.stripe_charge, name="stripe_charge"),
    path("coinbase/", views.payment_coinbase, name="coinbase"),
    path("paylike/", views.payment_paylike, name="paylike"),
    path("gopay-charge/", views.gopay_charge, name="gopay_charge"),
    path('payments/succeed/', views.payment_succeed, name='payment_succeed'),  # Correct URL pattern
    path("complete/", views.paymentComplete, name="complete"),
    path("create-invoice/", views.create_invoice, name="create_invoice"),
    path("invoice-detail/<int:id>/", views.invoice_detail, name="invoice_detail"),
    path("gopay-payment/", views.gopay_payment, name="gopay_payment"),
    path("charge/", views.charge, name="charge"),
    path('payment-method/', views.payment_method_view, name='payment_method'),
    path('payment-complete/', views.payment_complete_view, name='payment_complete'),
    path('payment-complete/', views.payment_complete_view, name='payment_complete_step'),

]
