import 'package:cognifeed_app/Models/passwordmodel.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:cognifeed_app/profile/profileBloc/managepassword_bloc.dart';
import 'package:cognifeed_app/profile/profileBloc/managepassword_event.dart';
import 'package:cognifeed_app/profile/profileBloc/managepassword_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordPage extends StatelessWidget {
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
            Text('Change Password',
                style: Theme.of(context).textTheme.headline),
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
      body: SingleChildScrollView(
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
    );
  }
}

class PasswordChangeForm extends StatefulWidget {
  @override
  _PasswordChangeFormState createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  ManagePasswordBloc managePasswordBloc;
  GlobalKey<FormState> _formKey;
  GlobalKey<FormFieldState> _newpwKey;
  final ChangePassword changePassword = ChangePassword();
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _newpwKey = GlobalKey<FormFieldState>();
    managePasswordBloc = ManagePasswordBloc();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Theme(
      data: customFormField(),
      child: Stack(
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0.006 * height),
                    child: TextFormField(
                      onSaved: (value) {
                        changePassword.currentpw = value;
                      },
                      validator: (password) => validatePassword(password),
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red[700],
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        errorText: "",
                        border: Theme.of(context).inputDecorationTheme.border,
                        icon: Icon(
                          FontAwesome.key,
                          size: 25,
                          color: Colors.black,
                        ),
                        hintText: 'Current Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0.006 * height),
                    child: TextFormField(
                      key: _newpwKey,
                      onSaved: (value) {
                        changePassword.newpw = value;
                      },
                      validator: (password) {
                        return validatePassword(password);
                      },
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red[700],
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        errorText: "",
                        border: Theme.of(context).inputDecorationTheme.border,
                        icon: Icon(
                          Icons.lock_outline,
                          size: 25,
                          color: Colors.black,
                        ),
                        hintText: 'New Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != _newpwKey.currentState.value) {
                        return "Password didn't match";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      changePassword.confirmpw = value;
                    },
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[700],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      icon: Icon(
                        Feather.check_circle,
                        size: 25,
                        color: Colors.black,
                      ),
                      hintText: 'Confirm New Password',
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
              child: BlocBuilder(
                bloc: managePasswordBloc,
                builder: (BuildContext context, state) {
                  if (state is ManagePasswordUninitialisedState) {
                    return Text(
                      'CHANGE',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    );
                  } else if (state is ManagePasswordRequestingState) {
                    return CircularProgressIndicator(
                      strokeWidth: 1,
                    );
                  } else if (state is ManagePasswordSuccessState) {
                    Fluttertoast.showToast(
                        msg: state.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    Navigator.of(context).pop();
                  } else if (state is ManagePasswordErrorState) {
                    Fluttertoast.showToast(
                        msg: state.error,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return Text(
                      'CHANGE',
                    );
                  }
                },
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  managePasswordBloc
                      .add(ChangePasswordEvent(changePassword: changePassword));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
