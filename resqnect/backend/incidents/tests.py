from django.test import TestCase
from rest_framework.test import APITestCase
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token

class IncidentTests(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username="test", password="1234")
        self.token = Token.objects.create(user=self.user)
        self.client.credentials(HTTP_AUTHORIZATION="Token " + self.token.key)

    def test_create_incident(self):
        response = self.client.post("/api/incidents/", {"title": "Test", "description": "Desc"})
        self.assertEqual(response.status_code, 201)

    def test_get_incidents(self):
        response = self.client.get("/api/incidents/")
        self.assertEqual(response.status_code, 200)

# Create your tests here.
