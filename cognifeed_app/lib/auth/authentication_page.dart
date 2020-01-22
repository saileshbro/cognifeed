import 'package:cognifeed_app/login/login_page.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:cognifeed_app/signup/signup_page.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  final UserRepository userRepository;

  const AuthenticationPage({Key key, @required this.userRepository})
      : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool showLogin = true;
  changeWindow() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        userRepository: widget.userRepository,
        onChangedScreen: changeWindow,
      );
    } else {
      return SignupPage(
        userRepository: widget.userRepository,
        onChangedScreen: changeWindow,
      );
    }
  }
}
