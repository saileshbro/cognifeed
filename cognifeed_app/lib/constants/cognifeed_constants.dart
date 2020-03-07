import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CognifeedColors {
  static const Color dockEggBlue = Color(0xffe9fdfc);
  static const Color aquaMarine = Color(0xff00c9c3);
  static const Color coralPink = Color(0xffff5a5f);
  static const Color teal = Color(0xff00928d);
  static const Color duskyBlue = Color(0xff445ba0);
}

ThemeData customFormField() {
  return ThemeData(
    buttonColor: CognifeedColors.coralPink,
    inputDecorationTheme: InputDecorationTheme(
      helperStyle: TextStyle(color: Colors.black),
      contentPadding: EdgeInsets.only(left: 25, top: 20, bottom: 0, right: 0),
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
}

class CognifeedTheme {
  static ThemeData getTheme(bool isDarkTheme) {
    if (isDarkTheme == false)
      return ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.crimsonText().fontFamily,
        textTheme: GoogleFonts.crimsonTextTextTheme(),
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
          helperStyle: TextStyle(color: Colors.teal),
          labelStyle: CognifeedTypography.textStyle2,
          hintStyle: TextStyle(
            color: CognifeedColors.teal,
          ),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              color: CognifeedColors.aquaMarine,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              width: 1.2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              width: 1.2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              width: 2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              width: 2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
        ),
      );
    else
      return ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.crimsonText().fontFamily,
        textTheme: GoogleFonts.crimsonTextTextTheme(),
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
          helperStyle: TextStyle(color: Colors.teal),
          labelStyle: CognifeedTypography.textStyle2,
          hintStyle: TextStyle(
            color: CognifeedColors.teal,
          ),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              color: CognifeedColors.aquaMarine,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              width: 1.2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              width: 1.2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              width: 2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              width: 2,
              color: CognifeedColors.aquaMarine,
            ),
          ),
        ),
      );
  }
}

class CognifeedTypography {
  static TextStyle textStyle2 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    // color: CognifeedColors.aquaMarine,
  );
  static TextStyle textStyle4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    // color: Colors.white,
  );
  static TextStyle textStyleOnboardHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static TextStyle searchBox = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );
  static TextStyle tags = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static TextStyle title = TextStyle(
    fontSize: 20,
    letterSpacing: 1,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: Color(0xff192965),
  );

  static TextStyle textStyle1 = TextStyle(
    fontSize: 28,
    color: Colors.black,
  );
  static TextStyle articleTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle articleDescription = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );
}

final String baseUrl = "http://192.168.0.19:3100/api";

class Cognifeed {
  static SharedPreferences pref;
  static DrawerPages drawerPages;
  static UserModel loggedInUser;
  static Dio dioClient = new Dio();
}

class UserModel {
  String email;
  String name;
  String token;
  String imageUrl;
  String phone;
  String bio;
  String address;
  String website;
  String about;

  UserModel({
    this.email,
    this.name,
    this.token,
    this.imageUrl,
    this.phone,
    this.bio,
    this.address,
    this.website,
    this.about,
  });
}
