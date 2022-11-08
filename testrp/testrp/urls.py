from django.urls import include, re_path

from .views import HomePageView, TestAPIView


urlpatterns = [
    re_path(r"^oidc/", include("mozilla_django_oidc.urls")),
    re_path(r"^api/$", TestAPIView.as_view(), name="api"),
    re_path(r"^$", HomePageView.as_view(), name="home"),
]
