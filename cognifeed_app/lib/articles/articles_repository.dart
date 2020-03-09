import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:meta/meta.dart';

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

  static Future hideArticle({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.delete(
        "$baseUrl/articles/$articleId/hide",
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

  static Future<ArticlesModel> incrementArticleView({String articleId}) async {
    try {
      final response =
          await Cognifeed.dioClient.get("$baseUrl/articles/$articleId");

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
