import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:cognifeed_app/login/login_bloc.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:string_validator/string_validator.dart' as validator;

import '../misc/loading_indicator.dart';
import 'login_events.dart';
import 'login_states.dart';

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
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    passwordFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onLoginPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: SizedBox.shrink(),
      backgroundColor: CognifeedColors.dockEggBlue,
      body: BlocListener<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (context, state) {
          if (state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder(
            bloc: BlocProvider.of<LoginBloc>(context),
            builder: (context, state) {
              return AnnotatedRegion(
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
                              height:
                                  MediaQuery.of(context).size.height * 0.25 -
                                      10),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: 148,
                            height: 50,
                          ),
                          SizedBox(height: 65),
                          Padding(
                            padding: const EdgeInsets.only(right: 141),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 55,
                                    child: TextFormField(
                                      autovalidate: true,
                                      validator: (value) {
                                        if (!validator.isEmail(value)) {
                                          return "Invalid Email";
                                        }
                                        return null;
                                      },
                                      focusNode: emailFocusNode,
                                      controller: _emailController,
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(passwordFocusNode);
                                      },
                                      style: TextStyle(
                                          color: CognifeedColors.teal),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        errorText: "",
                                        fillColor: CognifeedColors.aquaMarine,
                                        labelText: "Email",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Container(
                                    height: 55,
                                    child: Center(
                                      child: TextFormField(
                                        autovalidate: true,
                                        validator: (val) =>
                                            validatePassword(val),
                                        obscureText: obscurePassword,
                                        controller: _passwordController,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        },
                                        focusNode: passwordFocusNode,
                                        style: TextStyle(
                                            color: CognifeedColors.teal),
                                        decoration: InputDecoration(
                                          contentPadding: Theme.of(context)
                                              .inputDecorationTheme
                                              .contentPadding
                                              .add(EdgeInsets.only(top: 4)),
                                          errorText: "",
                                          suffixIcon: Container(
                                            height: 17,
                                            width: 17,
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
                                                  obscurePassword =
                                                      !obscurePassword;
                                                });
                                              },
                                            ),
                                          ),
                                          labelText: "Password",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Container(
                                    height: 33,
                                    width: 127,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text("Log In",
                                          style:
                                              CognifeedTypography.textStyle4),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _onLoginPressed();
                                        }
                                      },
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
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("/signup");
                                  },
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
                    ),
                    if (state is LoginLoading)
                      Container(
                        color: Colors.black38,
                        child: Center(child: LoadingIndicator()),
                      )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
