import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/login/login_bloc.dart';
import 'package:cognifeed_app/login/login_form.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9fdfc),
      body: Stack(
        children: <Widget>[
          // SvgPicture.asset(
          //   height: 128.0,
          // ),
        ],
      ),
    );
  }
}
