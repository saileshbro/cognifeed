import 'dart:io';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/cupertino.dart';

class FavRepository {
  static Future addToFav({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/articles/$articleId/add_fav",
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

  static Future removeFromFav({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.delete(
        "$baseUrl/articles/$articleId/remove_fav",
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
