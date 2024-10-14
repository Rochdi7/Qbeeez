from django.db import models
from django.conf import settings
from course.models import Program  # Make sure this import is correct
from accounts.models import User  # Adjust the import according to your project structure

from accounts.models import User  # Adjust the import according to your project structure
from course.models import Program  # Make sure this import is correct


class SalesPointFacture(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)  # This uses the User model
    program = models.ForeignKey(Program, on_delete=models.CASCADE)  # Make sure to use program field correctly
    pos_code = models.CharField(max_length=100)
    document1 = models.CharField(max_length=255, blank=True, null=True)  # Adjust as necessary
    status = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    reviewed_at = models.DateTimeField(null=True, blank=True)  # Ensure this field is defined

    def __str__(self):
        return f'Invoice for {self.user.username} - {self.program.title}'

    class Meta:
        verbose_name = 'point de vente Methode'
        verbose_name_plural = 'point de vente Methode'

class Facture(models.Model):
    # ForeignKey fields remain unchanged
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, db_column='user_id')
    program_id = models.ForeignKey(Program, on_delete=models.CASCADE, db_column='program_id')
    document1 = models.FileField(upload_to='documents/')
    document2 = models.FileField(upload_to='documents/')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # New fields for tracking status and review
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('accepted', 'Accepted'),
        ('rejected', 'Rejected'),
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    reviewed_at = models.DateTimeField(null=True, blank=True)  # Nullable if not reviewed yet

    def __str__(self):
        return f"Facture {self.id} - {self.status} for {self.user_id}"
    class Meta:
        verbose_name = 'Cih Bank Methode'
        verbose_name_plural = 'Cih Bank Methode'
    
class Invoice(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    total = models.FloatField(null=True, blank=True)
    amount = models.FloatField(null=True, blank=True)
    payment_complete = models.BooleanField(default=False)
    invoice_code = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.invoice_code

class Payment(models.Model):
    invoice = models.OneToOneField(Invoice, on_delete=models.CASCADE, related_name='payment')
    payment_method = models.CharField(max_length=50)  # e.g., 'Stripe', 'PayPal', 'GoPay'
    payment_status = models.CharField(max_length=50, choices=[
        ('pending', 'Pending'),
        ('completed', 'Completed'),
        ('failed', 'Failed'),
    ], default='pending')
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    transaction_id = models.CharField(max_length=100, unique=True, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.payment_method} - {self.transaction_id}"

    class Meta:
        ordering = ['-created_at']  # Orders payments by creation date, newest first
