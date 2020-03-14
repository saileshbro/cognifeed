import 'dart:io';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/tags/tags_model.dart';
import 'package:meta/meta.dart';

class TagRepository {
  static Future<TagArray> getTags() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/tags/");

      if (response.data.containsKey('error')) {
        return Future.error(response.data['error']);
      }
      return Future.value(TagArray.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future sendSelectedTags({@required TagArray tags}) async {
    try {
      final response =
          await Cognifeed.dioClient.post("$baseUrl/tags", data: tags.toJson());
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future follow({@required String tagId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/tags/$tagId/add",
      );
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future unfollow({@required String tagId}) async {
    try {
      final response = await Cognifeed.dioClient.delete(
        "$baseUrl/tags/$tagId/remove",
      );
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }
}
