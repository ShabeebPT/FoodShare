from django.shortcuts import render
from django.http import HttpResponse
from donation_details.models import DonationDetails
import datetime
# Create your views here.


from rest_framework.views import APIView,Response
from donation_details.serializers import android_serialiser

class donation_details(APIView):
    def post(self,request):
        obj=DonationDetails()
        obj.donation_details = request.data['donation_details']
        obj.d_id=request.data['did']
        # obj.r_id=5
        obj.address=request.data['address']
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.status='pending'
        obj.save()
        return HttpResponse('yes')

class view_details(APIView):
    def get(self, request):
        ob = DonationDetails.objects.all()
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)


class view_volu(APIView):
    def get(self, request):
        ob = DonationDetails.objects.all()
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)


class aprv(APIView):
    def post(self,request):
        ab=DonationDetails.objects.get(donation_id=request.data['orid'])
        ab.status="Approved"
        ab.r_id=request.data['uid']
        ab.save()
        return HttpResponse("yess")

class view_donors(APIView):
    def post(self,request):
        ob=DonationDetails.objects.filter(d_id=request.data['did'],status='approved')
        ser = android_serialiser(ob, many=True)
        print(ser)
        return Response(ser.data)