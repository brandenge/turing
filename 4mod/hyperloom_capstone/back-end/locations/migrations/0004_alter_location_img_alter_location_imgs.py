# Generated by Django 4.2.3 on 2023-08-24 20:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0003_alter_location_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='location',
            name='img',
            field=models.TextField(default='none'),
        ),
        migrations.AlterField(
            model_name='location',
            name='imgs',
            field=models.JSONField(default=list),
        ),
    ]