from django.shortcuts import render

# Create your views here.

def admin(request):
    return render(request,'temp/admin.html')

def index(request):
    return render(request,'temp/index.html')
