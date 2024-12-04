from django.shortcuts import render
from complaint.models import Complaint
from django.http import HttpResponse
import datetime
# Create your views here.

def post_reply(request,idd):
    if request.method=='POST':
        obj=Complaint.objects.get(complaint_id=idd)
        obj.reply=request.POST.get('Reply')
        obj.save()
        return view_complaint(request)
    return render(request, 'complaint/postreply.html')



def view_complaint(request):
    obj=Complaint.objects.all()
    context={
        'b':obj
    }
    return render(request, 'complaint/viewcomplaint.html',context)



from rest_framework.views import APIView,Response
from complaint.serializers import android_serialiser


class post_complaint(APIView):
    def post(self, request):
        obj=Complaint()
        obj.complaint_details=request.data['complaint_details']
        obj.r_id=request.data['rid']
        obj.reply='pending'
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
        return HttpResponse('yes')


class view_reply(APIView):
    def post(self,request):
        ob=Complaint.objects.filter(r_id=request.data['uid'])
        ser=android_serialiser(ob, many=True)
        return Response(ser.data)

