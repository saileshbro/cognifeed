import 'dart:io';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/cupertino.dart';

class FavRepository {
  static Future<String> addToFav({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/articles/$articleId/add_fav",
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
