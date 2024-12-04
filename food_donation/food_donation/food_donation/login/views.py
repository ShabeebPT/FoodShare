from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login
from user_reg.models import UserReg
from donor_reg.models import DonorReg
# Create your views here.
def login(request):
    if request.method =="POST":
        name=request.POST.get("un")
        password=request.POST.get("ps")
        obj=Login.objects.filter(username=name,password=password)
        tp = ""
        for ob in obj:
            tp=ob.type
            uid=ob.u_id
            if tp=="admin":
                request.session["u_id"]=uid
                return HttpResponseRedirect('/temp/admin/')
        else:
            objilist="incorrect username or password...pls try again..!"
            context={
                 "msg": objilist,
            }
            return render(request,'login/login.html',context)
    return render(request, 'login/login.html')

from rest_framework.views import APIView,Response
from login.serializers import android_serialiser

class login_flutter(APIView):
    def get(self,request):
        ob = Login.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)

    def post(self, request):
        username = request.data['username']
        password = request.data['password']
        ob = Login.objects.filter(username=username, password=password)
        if len(ob)>0:
            oo = ob[0]
            if ob[0].type=='user':
                ab = UserReg.objects.get(r_id=oo.u_id)
                ab.latitude = request.data['lat']
                ab.longitude = request.data['lon']
                ab.save()
            if ob[0].type == 'donor':
                abb=DonorReg.objects.get(d_id=oo.u_id)
                abb.latitude=request.data['lat']
                abb.longitude=request.data['lon']
                abb.save()
        ser = android_serialiser(ob, many=True)
        return Response(ser.data)


