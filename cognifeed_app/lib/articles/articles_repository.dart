import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/articles/articles_model.dart';

import '../constants/cognifeed_constants.dart';

class ArticleRepository {
  static Future<ArticlesModel> getHomePageArticles() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/articles/");

      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
      }
      return Future.value(ArticlesModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }

  static Future<ArticlesModel> getFavPageArticles() async {
    try {
      final response = await Cognifeed.dioClient.get("$baseUrl/articles/fav");

      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
      }
      return Future.value(ArticlesModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }
}
