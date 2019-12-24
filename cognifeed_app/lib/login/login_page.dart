import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/login/login_bloc.dart';
import 'package:cognifeed_app/login/login_form.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  FocusNode usernameFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPasswordFocusNode;
  @override
  void initState() {
    super.initState();
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: SizedBox.shrink(),
      backgroundColor: CognifeedColors.dockEggBlue,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: -1,
              top: -8,
              bottom: -9,
              left: -19,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/login.png",

                  // scale: 1.8,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 26),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25 - 10),
                  SvgPicture.asset(
                    "assets/images/logo.svg",
                    width: 148,
                    height: 50,
                  ),
                  SizedBox(height: 65),
                  Padding(
                    padding: const EdgeInsets.only(right: 141),
                    child: Form(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 40,
                            child: TextFormField(
                              focusNode: usernameFocusNode,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
                              style: TextStyle(color: CognifeedColors.teal),
                              decoration: InputDecoration(
                                fillColor: CognifeedColors.aquaMarine,
                                labelText: "Username",
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            height: 40,
                            child: TextFormField(
                              obscureText: obscurePassword,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              focusNode: confirmPasswordFocusNode,
                              style: TextStyle(color: CognifeedColors.teal),
                              decoration: InputDecoration(
                                suffixIcon: Container(
                                  height: 40,
                                  width: 40,
                                  child: FlatButton(
                                    shape: CircleBorder(),
                                    child: Icon(
                                      obscurePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 17,
                                      color: CognifeedColors.teal,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                labelText: "Password",
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            height: 33,
                            width: 127,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text("Log In",
                                  style: CognifeedTypography.textStyle4),
                              onPressed: () {},
                              color: CognifeedColors.aquaMarine,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: CognifeedTypography.textStyle4,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Container(
                        height: 33,
                        width: 90,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("Sign Up",
                              style: CognifeedTypography.textStyle4),
                          onPressed: () {},
                          color: CognifeedColors.duskyBlue,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
