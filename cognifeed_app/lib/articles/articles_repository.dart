import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../constants/cognifeed_constants.dart';

class ArticleRepository {
  static Future<ArticlesModel> getHomePageArticles(
      {String searchby, String query}) async {
    try {
      var response;
      // if (searchby.isNotEmpty && query.isNotEmpty) {
      response = await Cognifeed.dioClient.get("$baseUrl/articles",
          queryParameters: {'searchby': searchby, 'query': query});
      // } else {
      //   response = await Cognifeed.dioClient.get("$baseUrl/articles");
      // }

      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
      }
      return Future.value(ArticlesModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future<ArticlesModel> getHiddenPageArticles(
      {String searchby, String query}) async {
    try {
      var response;
      // if (searchby.isNotEmpty && query.isNotEmpty) {
      response = await Cognifeed.dioClient.get("$baseUrl/articles/hidden",
          queryParameters: {'searchby': searchby, 'query': query});
      // } else
      // response = await Cognifeed.dioClient.get("$baseUrl/articles/hidden");

      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
      }
      return Future.value(ArticlesModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
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
      if (e is DioError) {
        return Future.error(e.response.data['error']);
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
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future hideArticle({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
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
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future showArticle({@required String articleId}) async {
    try {
      final response = await Cognifeed.dioClient.post(
        "$baseUrl/articles/$articleId/show",
      );
      if (response.data.containsKey('error')) {
        return Future.error(response);
      }
      return Future.value(response);
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }

  static Future<ArticlesModel> getFavPageArticles(
      {String searchby, String query}) async {
    try {
      var response;
      // if (searchby.isEmpty && query.isNotEmpty) {
      response = await Cognifeed.dioClient.get("$baseUrl/articles/fav",
          queryParameters: {'searchby': searchby, 'query': query});
      // } else
      //   response = await Cognifeed.dioClient.get("$baseUrl/articles/fav");
      print(response);
      if (response.data.containsKey('error')) {
        return Future.error(jsonDecode(response.data)['error']);
      }
      return Future.value(ArticlesModel.fromJson(response.data));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      if (e is DioError) {
        return Future.error(e.response.data['error']);
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
      if (e is DioError) {
        return Future.error(e.response.data['error']);
      }
      return Future.error(e.toString());
    }
  }
}
