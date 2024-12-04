from django.http import HttpResponse
from django.shortcuts import render
from volunteer_reg.models import VolunteerReg
# Create your views here.

from rest_framework.views import APIView,Response
from tracking.serializers import android_serialiser

class track(APIView):
    def post(self,request):
        objs=VolunteerReg.objects.filter(vol_no=request.data['cno'])
        if len(objs)>0:
            obj=objs[0]
        else:
            obj=VolunteerReg.objects.get(v_id=request.session['u_id'])
        obj.vol_no=request.data['cno']
        obj.latitude=request.data['lat']
        obj.longitude=request.data['lon']
        obj.save()
        return HttpResponse('yes')


class map(APIView):
    def get(self,request):
        obj=VolunteerReg.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

class aaaa(APIView):
    def post(self,request):
        return HttpResponse('yes')

def view_map(request,idd):
    obj=VolunteerReg.objects.get(v_id=idd)
    context={
        'lat':obj.latitude,
        'lon':obj.longitude
    }
    return render(request,'tracking/track.html',context)