# Generated by Django 4.2.3 on 2023-08-24 20:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('worlds', '0005_world_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='world',
            name='genres',
            field=models.JSONField(default=list),
        ),
    ]