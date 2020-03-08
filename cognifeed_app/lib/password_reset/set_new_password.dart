import 'package:cognifeed_app/Models/passwordmodel.dart';
import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_bloc.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_event.dart';
import 'package:cognifeed_app/profile/bloc/managepassword_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SetPasswordPage extends StatelessWidget {
  final String email;

  const SetPasswordPage({
    Key key,
    @required this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2fcfe).withOpacity(0.8),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Reset Password', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Icon(
              Feather.lock,
              size: 25,
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<ManagePasswordBloc, ManagePasswordState>(
        bloc: BlocProvider.of<ManagePasswordBloc>(context),
        listener: (BuildContext context, ManagePasswordState state) {
          if (state is ManagePasswordSuccessState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).popUntil(
              ModalRoute.withName('/'),
            );
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          } else if (state is ManagePasswordErrorState) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 0.15 * height,
                  ),
                  PasswordChangeForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordChangeForm extends StatefulWidget {
  @override
  _PasswordChangeFormState createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  FocusNode codeFocusNode, newPWFocusNode, confirmPWFocusNode;
  bool obscureNP = true;
  bool obscureConP = true;
  GlobalKey<FormState> _formKey;
  TextEditingController passwordController, confirmPasswordController;
  final ChangePassword changePassword = ChangePassword();
  bool codeAutoVal = false, pwAutoVal = false, confPwAutoVal = false;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    codeFocusNode = FocusNode();
    newPWFocusNode = FocusNode();
    confirmPWFocusNode = FocusNode();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    codeFocusNode.dispose();
    newPWFocusNode.dispose();
    confirmPWFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: 310,
          margin: EdgeInsets.fromLTRB(
              0.08 * width, .02 * height, .08 * width, .054 * height),
          padding: EdgeInsets.fromLTRB(
              .02 * width, .034 * height, .02 * width, .05 * height),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: .03,
                  color: Colors.black.withOpacity(.3),
                )
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0.006 * height),
                  child: TextFormField(
                    autovalidate: codeAutoVal,
                    focusNode: codeFocusNode,
                    onTap: () {
                      setState(() {
                        codeAutoVal = true;
                      });
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Verification code is required!";
                      }
                      return null;
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(newPWFocusNode);
                      setState(() {
                        pwAutoVal = true;
                      });
                    },
                    onSaved: (value) {
                      changePassword.vcode = value;
                    },
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      prefixIcon: Icon(
                        Feather.hash,
                        size: 18,
                        color: Colors.black,
                      ),
                      hintText: 'Verification Code',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0.006 * height),
                  child: TextFormField(
                    autovalidate: pwAutoVal,
                    focusNode: newPWFocusNode,
                    onTap: () {
                      setState(() {
                        pwAutoVal = true;
                      });
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(confirmPWFocusNode);
                      setState(() {
                        confPwAutoVal = true;
                      });
                    },
                    onSaved: (value) {
                      changePassword.newpw = value;
                    },
                    validator: (password) {
                      return validatePassword(password);
                    },
                    obscureText: obscureNP,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: passwordController,
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 18,
                        color: Colors.black,
                      ),
                      hintText: 'New Password',
                      suffixIcon: IconButton(
                          icon: obscureNP
                              ? Icon(
                                  FontAwesome5Solid.eye_slash,
                                  size: 15,
                                  color: Colors.black,
                                )
                              : Icon(
                                  FontAwesome5Solid.eye,
                                  size: 15,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            setState(() {
                              obscureNP = !obscureNP;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0.006 * height),
                  child: TextFormField(
                    autovalidate: confPwAutoVal,
                    focusNode: confirmPWFocusNode,
                    onTap: () {
                      setState(() {
                        confPwAutoVal = true;
                      });
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        return "Password didn't match";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      changePassword.confirmpw = value;
                    },
                    obscureText: obscureConP,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      prefixIcon: Icon(
                        Feather.check_circle,
                        size: 18,
                        color: Colors.black,
                      ),
                      hintText: 'Confirm New Password',
                      suffixIcon: IconButton(
                          icon: obscureConP
                              ? Icon(
                                  FontAwesome5Solid.eye_slash,
                                  size: 15,
                                  color: Colors.black,
                                )
                              : Icon(
                                  FontAwesome5Solid.eye,
                                  size: 15,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            setState(() {
                              obscureConP = !obscureConP;
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: .029 * height,
          left: (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
          right: (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
          child: RaisedButton(
            color: Theme.of(context).buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: BlocBuilder<ManagePasswordBloc, ManagePasswordState>(
              bloc: BlocProvider.of<ManagePasswordBloc>(context),
              builder: (BuildContext context, state) {
                if (state is ManagePasswordUninitialisedState) {
                  return Text(
                    'RESET',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                } else if (state is ManagePasswordRequestingState) {
                  return CircularProgressIndicator(
                    strokeWidth: 1,
                  );
                } else {
                  return Text(
                    'RESET',
                  );
                }
              },
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(changePassword.toJson().toString());
                BlocProvider.of<ManagePasswordBloc>(context)
                    .add(ForgetPasswordEvent(changePassword: changePassword));
              }
            },
          ),
        )
      ],
    );
  }
}
