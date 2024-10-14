from django import forms
from .models import Facture, SalesPointFacture  # Import the ActiveAbonnement model

class SalesPointFactureForm(forms.ModelForm):
    class Meta:
        model = SalesPointFacture
        fields = ['program', 'pos_code', 'document1']  # Ensure these match your model fields


class FactureForm(forms.ModelForm):
    class Meta:
        model = Facture
        fields = ['program_id', 'document1', 'document2', 'user_id']  # Include program_id


