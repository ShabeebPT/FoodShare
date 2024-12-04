from django.conf.urls import url
from excess_food_report import views

urlpatterns = [
    url('excess_food_report/',views.excess_food_report.as_view()),
    url('view_report/', views.view_report.as_view()),
    url('aaa/', views.view.as_view()),
]