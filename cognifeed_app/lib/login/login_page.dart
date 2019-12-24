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
          Positioned(
            left: -1,
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 203),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Cognifeed',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.33,
                        color: Color(0xff00c9c3),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
