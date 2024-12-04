from django.shortcuts import render
from django.http import HttpResponse
from excess_food_report.models import ExcessFoodReport
# Create your views here.

from rest_framework.views import APIView,Response
from excess_food_report.serializers import android_serialiser

class excess_food_report(APIView):
    def post(self,request):
        obj=ExcessFoodReport()
        obj.d_id=1
        obj.food_details=request.data['food_details']
        obj.save()
        return HttpResponse('yes')

class view_report(APIView):
    def get(self,request):
        ob=ExcessFoodReport.objects.all()
        ser=android_serialiser(ob, many=True)
        return Response(ser.data)


class view(APIView):
    def get(self,request):
        ob=ExcessFoodReport.objects.all()
        ser=android_serialiser(ob, many=True)
        return Response(ser.data)