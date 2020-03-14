import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:cognifeed_app/login/login_bloc.dart';
import 'package:cognifeed_app/misc/loading_indicator.dart';
import 'package:cognifeed_app/password_reset/forgot_password_page.dart';
import 'package:cognifeed_app/repository/user_repository.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:string_validator/string_validator.dart' as validator;

import 'login_events.dart';
import 'login_states.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
  final VoidCallback onChangedScreen;

  LoginPage(
      {Key key, @required this.userRepository, @required this.onChangedScreen})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;
  bool autoValidateEmail = false;
  bool autoValidatePassword = false;
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
      appBar:
      PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: SizedBox.shrink(),
      body: BlocListener<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (context, state) {
          if (state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${state.error}',
                ),
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
                  // fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        // mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 30),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/images/logo.svg",
                                width: 148,
                                height: 50,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                child: FlareActor(
                                  "assets/flare/cognifeed3.flr",
                                  animation: 'animate',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Form(
                            key: _formKey,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autoValidateEmail,
                                    validator: (value) {
                                      if (!validator.isEmail(value)) {
                                        return "Invalid Email";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      setState(() {
                                        autoValidateEmail = true;
                                      });
                                    },
                                    focusNode: emailFocusNode,
                                    controller: _emailController,
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(passwordFocusNode);
                                      setState(() {
                                        autoValidatePassword = true;
                                      });
                                    },
                                    style:
                                    TextStyle(color: CognifeedColors.teal),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          FontAwesome.envelope_o,
                                          size: 18,
                                        ),
                                        errorText: "",
                                        hintText: "Email"),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 80,
                                  child: Center(
                                    child: TextFormField(
                                      autovalidate: autoValidatePassword,
                                      validator: (val) => validatePassword(val),
                                      obscureText: obscurePassword,
                                      controller: _passwordController,
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        autoValidateEmail = true;
                                        setState(() {});
                                      },
                                      onTap: () {
                                        setState(() {
                                          autoValidatePassword = true;
                                        });
                                      },
                                      focusNode: passwordFocusNode,
                                      style: TextStyle(
                                          color: CognifeedColors.teal),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          FontAwesome.key,
                                          size: 18,
                                        ),
                                        errorText: "",
                                        hintText: "Password",
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
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                obscurePassword =
                                                !obscurePassword;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ForgotPasswordPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Forgot Password?",
                                        style: CognifeedTypography.medium
                                            .copyWith(
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.end,
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
                                        style: CognifeedTypography.small
                                            .copyWith(
                                          color: BlocProvider
                                              .of<ThemeBloc>(
                                              context)
                                              .isDarkTheme
                                              ? Colors.black
                                              : Colors.white,
                                        )),
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
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: CognifeedTypography.small,
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
                                      style: CognifeedTypography.small
                                          .copyWith(color: Colors.white)),
                                  onPressed: widget.onChangedScreen,
                                  color: Colors.black,
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
