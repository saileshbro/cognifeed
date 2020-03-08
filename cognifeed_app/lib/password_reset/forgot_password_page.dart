import 'package:cognifeed_app/password_reset/set_new_password.dart';
import 'package:flutter/material.dart';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ForgotPasswordPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 0.15 * height,
                ),
                EmailInputForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmailInputForm extends StatefulWidget {
  @override
  _EmailInputFormState createState() => _EmailInputFormState();
}

class _EmailInputFormState extends State<EmailInputForm> {
  GlobalKey<FormState> _formKey;
  TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
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
            height: 143,
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
                      validator: (email) => validateEmail(email),
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        errorText: "",
                        border: Theme.of(context).inputDecorationTheme.border,
                        icon: Icon(
                          FontAwesome5.envelope_open,
                          size: 25,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
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
              child: Text(
                'SEND CODE',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SetPasswordPage(
                      email: emailController.text,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
