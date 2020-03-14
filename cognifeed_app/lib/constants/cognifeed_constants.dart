import 'package:cognifeed_app/auth/user_model.dart';
import 'package:cognifeed_app/pushnotification/push_notification_service.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CognifeedColors {
  static const Color dockEggBlue = Color(0xffe9fdfc);
  static const Color aquaMarine = Color(0xff00c9c3);
  static const Color coralPink = Color(0xffff5a5f);
  static const Color teal = Color(0xff00928d);
  static const Color duskyBlue = Color(0xff445ba0);
}

class CognifeedTheme {
  static ThemeData getTheme(bool isDarkTheme) {
    if (isDarkTheme == false)
      return ThemeData(
        primaryColor: Colors.white,
        buttonColor: CognifeedColors.coralPink,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          size: 18,
          color: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          helperStyle: TextStyle(color: Colors.black),
          contentPadding:
              EdgeInsets.only(left: 25, top: 20, bottom: 0, right: 0),
          labelStyle: CognifeedTypography.articleDescription,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.65),
            fontSize: 15,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.orange,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffff5a5f),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
      );
    else
      return ThemeData(
        canvasColor: Color(0xff212121),
        scaffoldBackgroundColor: Color(0xff212121),
        buttonColor: CognifeedColors.coralPink,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Color(0xff1b1b1b),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          size: 18,
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          helperStyle: TextStyle(color: Colors.white),
          contentPadding:
              EdgeInsets.only(left: 25, top: 20, bottom: 0, right: 0),
          labelStyle: CognifeedTypography.articleDescription,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.65),
            fontSize: 15,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.orange,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffff5a5f),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
      );
  }
}

class CognifeedTypography {
  static TextStyle medium = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    // color: CognifeedColors.aquaMarine,
  );
  static TextStyle small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    // color: Colors.white,
  );
  static TextStyle large = TextStyle(
    fontSize: 24,
  );
  static TextStyle articleTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static TextStyle articleDescription = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );
}

final String baseUrl = "http://192.168.0.2:3100/api";

class Cognifeed {
  static SharedPreferences pref;
  static DrawerPages drawerPages;
  static UserModel loggedInUser;
  static Dio dioClient = new Dio();
  static PushNotificationService pushNotificationService =
      PushNotificationService();
}
