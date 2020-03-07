import 'dart:convert';
import 'dart:io';

import 'package:cognifeed_app/articles/articles_model.dart';

import 'package:http/http.dart' as http;

import '../constants/cognifeed_constants.dart';

class ArticleRepository {
  static Future<ArticlesModel> getHomePageArticles() async {
    try {
      final response = await http.get("$baseUrl/articles");

      if ((jsonDecode(response.body) as Map).containsKey('error')) {
        return Future.error(jsonDecode(response.body)['error']);
      }
      return Future.value(ArticlesModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      if (e is SocketException) {
        return Future.error("Unable to connect to internet.");
      }
      return Future.error(e.toString());
    }
  }
}
