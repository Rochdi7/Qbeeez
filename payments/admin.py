from django.contrib import admin
from django.utils.html import format_html
from django.utils import timezone
from .models import  Payment, Facture, SalesPointFacture  # Import SalesPointFacture


@admin.register(Facture)
class FactureAdmin(admin.ModelAdmin):
    list_display = ('id', 'user_id', 'program_id', 'status', 'created_at', 'updated_at', 'reviewed_at', 'document_links')
    search_fields = ('user_id__username', 'program_id__title', 'status')
    list_filter = ('status',)  # Filter for status

    actions = ['mark_as_paid', 'mark_as_rejected']

    def document_links(self, obj):
        document1_url = obj.document1.url if obj.document1 else "#"
        document2_url = obj.document2.url if obj.document2 else "#"
        return format_html(
            '<a href="{}" target="_blank">View Recu</a> | <a href="{}" target="_blank">View Carte Etudiant</a>',
            document1_url, document2_url
        )
    document_links.short_description = 'Documents'

    def mark_as_paid(self, request, queryset):
        queryset.update(status='Paid', reviewed_at=timezone.now())  # Mark as paid and update reviewed_at
        self.message_user(request, "Selected factures have been marked as paid.")

    def mark_as_rejected(self, request, queryset):
        queryset.update(status='Rejected', reviewed_at=timezone.now())  # Mark as rejected and update reviewed_at
        self.message_user(request, "Selected factures have been marked as rejected.")

    mark_as_paid.short_description = "Mark selected factures as paid"
    mark_as_rejected.short_description = "Mark selected factures as rejected"

@admin.register(SalesPointFacture)
class SalesPointFactureAdmin(admin.ModelAdmin):
    list_display = ('id', 'user_id', 'program_id', 'pos_code', 'status', 'created_at', 'reviewed_at')
    search_fields = ('user_id__username', 'program_id__title', 'pos_code', 'status')
    list_filter = ('status',)

    actions = ['mark_as_paid', 'mark_as_rejected', 'mark_as_reviewed']

    def mark_as_paid(self, request, queryset):
        queryset.update(status='Paid', reviewed_at=timezone.now())  # Mark as paid
        self.message_user(request, "Selected sales point factures have been marked as paid.")

    def mark_as_rejected(self, request, queryset):
        queryset.update(status='Rejected', reviewed_at=timezone.now())  # Mark as rejected
        self.message_user(request, "Selected sales point factures have been marked as rejected.")

    def mark_as_reviewed(self, request, queryset):
        queryset.update(reviewed_at=timezone.now())  # Update reviewed_at to now
        self.message_user(request, "Selected sales point factures have been marked as reviewed.")

    mark_as_paid.short_description = "Mark selected sales point factures as paid"
    mark_as_rejected.short_description = "Mark selected sales point factures as rejected"
    mark_as_reviewed.short_description = "Mark selected sales point factures as reviewed"
