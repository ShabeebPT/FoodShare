from django.shortcuts import render
from django.http import HttpResponse
from user_reg.models import UserReg
from login.models import Login
# Create your views here.

from rest_framework.views import APIView,Response
from user_reg.serializers import android_serialiser

class user_reg(APIView):
    def post(self,request):
        obj=UserReg()
        obj.password=request.data['password']
        obj.user_name=request.data['user_name']
        obj.ph_no=request.data['ph_no']
        obj.latitude='pending'
        obj.longitude='pending'
        obj.save()
        ob = Login()
        ob.username = obj.user_name
        ob.password = obj.password
        ob.type = 'user'
        ob.u_id = obj.r_id
        ob.save()
        return HttpResponse('yes')

class view_registration(APIView):
    def get(self,request):
        ob=UserReg.objects.all()
        ser=android_serialiser(ob, many=True)
        return Response(ser.data)


class map(APIView):
    def get(self,request):
        obj=UserReg.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

class aaaa(APIView):
    def post(self,request):
        return HttpResponse('yes')

def view_map(request,idd):
    obj=UserReg.objects.get(r_id=idd)
    context={
        'lat':obj.latitude,
        'lon':obj.longitude
    }
    return render(request,'user_reg/track.html',context)

class mappp(APIView):
    def get(self,request):
        obj=UserReg.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

class bbb(APIView):
    def post(self,request):
        return HttpResponse('yes')

def viewmap(request,idd):
    obj=UserReg.objects.get(r_id=idd)
    context={
        'lat':obj.latitude,
        'lon':obj.longitude
    }
    return render(request,'user_reg/track.html',context)