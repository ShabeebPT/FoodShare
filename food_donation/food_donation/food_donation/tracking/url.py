from django.conf.urls import url
from tracking import views

urlpatterns=[
    url('android/',views.track.as_view()),
    url('track/',views.map.as_view()),
    url('a/(?P<idd>\w+)', views.view_map),


]