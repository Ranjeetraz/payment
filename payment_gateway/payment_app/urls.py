# payment_gateway/urls.py

from django.urls import path
from payment_app import views

urlpatterns = [
    path('create-checkout-session', views.create_checkout_session, name='create-checkout-session'),
    path('success/', views.success, name='success'),
    path('cancel/', views.cancel, name='cancel'),
    path('', views.home, name='home'),

]
