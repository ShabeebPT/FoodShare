from django.conf.urls import url
from donor_reg import views

urlpatterns = [
    url('post_registration/', views.donor_reg.as_view()),
    url('view/', views.view_registration.as_view()),
    url('view_foodreport/', views.view_foodreport.as_view()),
    url('track/', views.map.as_view()),
    url('a/(?P<idd>\w+)', views.view_map),
    url('volunteer/', views.map_donor.as_view()),
    url('b/(?P<idd>\w+)', views.view_vol),
]