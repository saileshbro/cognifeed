import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/tags/tags_model.dart';
import 'package:meta/meta.dart';

import '../constants/cognifeed_constants.dart';

class TagRepository {
  static Future<TagArray> getTags() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/tags/");

      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
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
          await Cognifeed.dioClient.post("$baseUrl/tags/", data: tags.toJson());
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

  static Future selectTag({@required String tagId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/tags/$tagId/selectTag",
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

  static Future unselectTag({@required String tagId}) async {
    try {
      final response = await Cognifeed.dioClient.delete(
        "$baseUrl/tags/$tagId/unselectTag",
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
