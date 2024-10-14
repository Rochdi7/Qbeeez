from django import template

register = template.Library()

@register.filter
def divide(value, divisor):
    return value // divisor if divisor else 0

