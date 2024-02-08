from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Member

def members(request):
    members = Member.objects.all().values()
    template = loader.get_template('all_members.html')
    context = {
        'members': members,
    }
    return HttpResponse(template.render(context, request))

def details(request, slug):
    member = Member.objects.get(slug=slug)
    template = loader.get_template('details.html')
    context = {
        'member': member,
    }
    return HttpResponse(template.render(context, request))

def main(request):
    template = loader.get_template('main.html')
    return HttpResponse(template.render())

def testing(request):
    members = Member.objects.all()
    template = loader.get_template('template.html')
    context = {
        'members': members,
    }
    return HttpResponse(template.render(context, request))
