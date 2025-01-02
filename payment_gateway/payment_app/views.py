from django.shortcuts import render

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import stripe
from django.conf import settings

# Stripe API key set karein
stripe.api_key = settings.STRIPE_SECRET_KEY

@csrf_exempt
def create_checkout_session(request):
    if request.method == "POST":
        try:
            # Stripe Checkout session create karein
            session = stripe.checkout.Session.create(
                payment_method_types=["card"],  # Payment method types
                line_items=[{
                    "price_data": {
                        "currency": "usd",
                        "product_data": {
                            "name": "Test Product",  # Product ka naam
                        },
                        "unit_amount": 2000,  # Price in cents (i.e., $20.00)
                    },
                    "quantity": 1,
                }],
                mode="payment",  # Mode for payment session
                success_url="http://localhost:8000/success/",  # Success URL
                cancel_url="http://localhost:8000/cancel/",  # Cancel URL
            )
            return JsonResponse({"id": session.id})  # Return the session ID to frontend
        except stripe.error.StripeError as e:
            return JsonResponse({"error": str(e)}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
    else:
        return JsonResponse({"error": "Invalid request method"}, status=405)

def success(request):
    return render(request, "success.html")

def home(request):
    return render(request, "home.html")



def cancel(request):
    return render(request, "cancel.html")





# jfbqewr  push2




