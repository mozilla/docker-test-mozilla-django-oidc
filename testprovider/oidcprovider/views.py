from django.views.generic.base import TemplateView
from django.contrib.auth.models import User


class HomePageView(TemplateView):
    template_name = "home.html"


def delete_user(request):
    User.objects.all().delete()
