from django.http import HttpResponse
from django.shortcuts import render

def indexpage(request, *args, **kwargs):
    return render(request,"index.html")