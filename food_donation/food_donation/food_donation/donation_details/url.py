from donation_details import views
from django.conf.urls import url

urlpatterns = [
    url('post_donation/',views.donation_details.as_view()),
    url('view_details/', views.view_details.as_view()),
    url('view_donors/', views.view_donors.as_view()),
    url('approve/',views.aprv.as_view()),
    url('view_vol/',views.view_volu.as_view())

]