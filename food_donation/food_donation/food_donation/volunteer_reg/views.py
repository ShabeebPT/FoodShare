from django.shortcuts import render
from volunteer_reg.models import VolunteerReg
from django.http import HttpResponse
from login.models import Login
# Create your views here.
def volunteer_register(request):
    if request.method=='POST':
        obj=VolunteerReg()
        obj.password=request.POST.get('123')
        obj.user_name=request.POST.get('mymu')
        obj.address=request.POST.get('malappuram')
        obj.ph_no=request.POST.get('1234567890')
        obj.latitude='pending'
        obj.longitude='pending'
        obj.vol_no=request.POST.get('cno')
        obj.save()
        ob=Login()
        ob.username=obj.user_name
        ob.password=obj.password
        ob.type='volunteer'
        ob.u_id=obj.v_id
        ob.save()
    return render(request, 'volunteer_reg/volunteerregister.html')

from rest_framework.views import APIView,Response
from volunteer_reg.serializers import android_serialiser

# class volunteer_register(APIView):
#     def volunteer_registration(self,request):
#         obj=volunteer_register()
#         obj.v_id=request.data['v_id']
#         obj.user_name=request.data['user_name']
#         obj.password=request.data['password']
#         obj.address=request.data['address']
#         obj.ph_no=request.data['ph_no']
#         obj.save()
#         return HttpResponse('yes')