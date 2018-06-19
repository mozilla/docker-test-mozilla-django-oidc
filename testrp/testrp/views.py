from django.views.generic.base import TemplateView
from mozilla_django_oidc.utils import is_authenticated
from rest_framework.response import Response
from rest_framework.views import APIView


class HomePageView(TemplateView):

    template_name = "home.html"


class TestAPIView(APIView):

    def get(self, request):
        return Response({
            'is_authenticated': is_authenticated(request.user)
        })
