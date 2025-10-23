from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Incident
from rest_framework import serializers
from .models import DeviceToken

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    class Meta:
        model = User
        fields = ["id", "username", "email", "password"]

    def create(self, validated_data):
        user = User(username=validated_data["username"], email=validated_data.get("email",""))
        user.set_password(validated_data["password"])
        user.save()
        return user

class IncidentSerializer(serializers.ModelSerializer):
    reporter = serializers.ReadOnlyField(source="reporter.username")
    class Meta:
        model = Incident
        fields = "__all__"
        read_only_fields = ["status", "created_at"]


class DeviceTokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = DeviceToken
        fields = ["id", "token", "created_at"]

