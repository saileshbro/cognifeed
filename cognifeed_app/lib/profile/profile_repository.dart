import 'dart:io';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:meta/meta.dart';

class ProfileRepository {
  static Future<ProfileResponseModel> getUserProfile() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/users/profile");
      if (response.data.containsKey('error')) {
        return Future.error(response.data['error']);
      }
      return Future.value(ProfileResponseModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future<String> updateUserProfile({
    @required String name,
    @required String email,
    @required String phone,
    @required String bio,
    @required String website,
    @required String address,
    @required String about,
  }) async {
    try {
      final response = await Cognifeed.dioClient.patch(
        "$baseUrl/users/profile",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "bio": bio,
          "website": website,
          "address": address,
          "about": about,
        },
      );
      if (response.data.containsKey('error')) {
        return Future.error(response.data['error']);
      }
      return Future.value(response.data['message']);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future<String> changePassword({
    @required String currentPassword,
    @required String newPassword,
  }) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/users/changepw",
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
        },
      );
      if (response.data.containsKey('error')) {
        return Future.error(response.data['error']);
      }
      return Future.value(response.data['message']);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }
}
