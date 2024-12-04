from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
from donor_reg.models import DonorReg
from login.models import Login

from rest_framework.views import APIView,Response
from donor_reg.serializers import android_serialiser

class donor_reg(APIView):
    def post(self,request):
        obj=DonorReg()
        obj.password=request.data['password']
        obj.user_name=request.data['user_name']
        obj.address=request.data['address']
        obj.ph_no=request.data['ph_no']
        obj.longitude='pending'
        obj.latitude='pending'
        obj.save()
        ob=Login()
        ob.username=obj.user_name
        ob.password=obj.password
        ob.type='donor'
        ob.u_id=obj.d_id
        ob.save()
        return HttpResponse('yes')

class view_registration(APIView):
    def get(self,request):
        ob=DonorReg.objects.all()
        ser=android_serialiser(ob,many=True)
        return Response(ser.data)

class view_foodreport(APIView):
    def get(self,request):
        ob=DonorReg.objects.all()
        ser=android_serialiser(ob,many=True)
        return Response(ser.data)


class map(APIView):
    def get(self,request):
        obj=DonorReg.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

class aaaa(APIView):
    def post(self,request):
        return HttpResponse('yes')

def view_map(request,idd):
    obj=DonorReg.objects.get(d_id=idd)
    context={
        'lat':obj.latitude,
        'lon':obj.longitude
    }
    return render(request,'donor_reg/track.html',context)


class map_donor(APIView):
    def get(self,request):
        obj=DonorReg.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

class aaa(APIView):
    def post(self,request):
        return HttpResponse('yes')

def view_vol(request,idd):
    obj=DonorReg.objects.get(d_id=idd)
    context={
        'lat':obj.latitude,
        'lon':obj.longitude
    }
    return render(request,'donor_reg/track1.html',context)