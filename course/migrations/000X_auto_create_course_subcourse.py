# Generated by Django 4.2.16 on 2024-10-01 20:30

from django.db import migrations, models
import django.db.models.deletion

class Migration(migrations.Migration):

    dependencies = [
     #    ('course', '000X_previous_migration'),  # Replace with the last migration number for the course app
    ]

    operations = [
        migrations.CreateModel(
            name='Subcourse',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='Title')),
                ('description', models.TextField(blank=True, verbose_name='Description')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='course.course')),
            ],
            options={
                'verbose_name': 'Subcourse',
                'verbose_name_plural': 'Subcourses',
            },
        ),
    ]