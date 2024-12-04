from django.conf.urls import url
from user_reg import views

urlpatterns = [
    url('post_registration/',views.user_reg.as_view()),
    url('view/', views.view_registration.as_view()),
    url('track/',views.map.as_view()),
    url('a/(?P<idd>\w+)', views.view_map),
    url('kkkkk/',views.mappp.as_view()),
    url('b/(?P<idd>\w+)', views.viewmap),
]