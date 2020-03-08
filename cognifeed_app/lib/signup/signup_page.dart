import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:string_validator/string_validator.dart' as validator;
import '../auth/authentication_bloc.dart';
import '../auth/authentication_states.dart';
import '../helpers/customValidator.dart';
import '../login/login_bloc.dart';
import '../login/login_events.dart';
import '../login/login_states.dart';
import '../misc/loading_indicator.dart';
import '../repository/user_repository.dart';

class SignupPage extends StatefulWidget {
  final UserRepository userRepository;
  final Function onChangedScreen;

  const SignupPage(
      {Key key, @required this.userRepository, @required this.onChangedScreen})
      : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool autoValidateEmail = false;
  bool autoValidatePassword = false;
  bool autoValidateName = false;
  bool autovalidateConfirmPassword = false;
  bool autoValidatePhone = false;
  FocusNode emailFocusNode;
  FocusNode phoneNumberFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPasswordFocusNode;
  FocusNode nameFocusNode;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _phoneNumberController;
  TextEditingController _nameController;
  TextEditingController _confirmPasswordController;
  GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    _emailController..dispose();
    _passwordController..dispose();
    _nameController.dispose();
    _confirmPasswordController..dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onSignUpPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        SignupButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
          phone: _phoneNumberController.text,
        ),
      );
    }

    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: SizedBox.shrink(),
      body: BlocListener(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName));
          }
        },
        child: BlocListener(
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
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        // mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: 148,
                            height: 50,
                          ),
                          SizedBox(height: 45),
                          Form(
                            key: _formKey,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autoValidateName,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onTap: () {
                                      setState(() {
                                        autoValidateName = true;
                                      });
                                    },
                                    validator: (value) {
                                      if (!value.isNotEmpty) {
                                        return "Invalid Name";
                                      }
                                      return null;
                                    },
                                    controller: _nameController,
                                    focusNode: nameFocusNode,
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(emailFocusNode);
                                      autoValidateEmail = true;
                                      setState(() {});
                                    },
                                    style:
                                        TextStyle(color: CognifeedColors.teal),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 18,
                                      ),
                                      errorText: "",
                                      fillColor: CognifeedColors.aquaMarine,
                                      hintText: "Name",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autoValidateEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    onTap: () {
                                      setState(() {
                                        autoValidateEmail = true;
                                      });
                                    },
                                    validator: (value) {
                                      if (!validator.isEmail(value)) {
                                        return "Invalid Email";
                                      }
                                      return null;
                                    },
                                    controller: _emailController,
                                    focusNode: emailFocusNode,
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(phoneNumberFocusNode);
                                      autoValidatePhone = true;
                                      setState(() {});
                                    },
                                    style:
                                        TextStyle(color: CognifeedColors.teal),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        size: 18,
                                      ),
                                      errorText: "",
                                      fillColor: CognifeedColors.aquaMarine,
                                      hintText: "Email",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autoValidatePhone,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                      signed: false,
                                      decimal: false,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        autoValidatePhone = true;
                                      });
                                    },
                                    validator: (val) => validatePhone(val),
                                    controller: _phoneNumberController,
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(passwordFocusNode);
                                      setState(() {
                                        autoValidatePassword = true;
                                      });
                                    },
                                    focusNode: phoneNumberFocusNode,
                                    style:
                                        TextStyle(color: CognifeedColors.teal),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        size: 18,
                                      ),
                                      errorText: "",
                                      hintText: "Phone Number",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autoValidatePassword,
                                    onTap: () {
                                      setState(() {
                                        autoValidatePassword = true;
                                      });
                                    },
                                    validator: (val) => validatePassword(val),
                                    controller: _passwordController,
                                    obscureText: obscurePassword,
                                    onEditingComplete: () {
                                      FocusScope.of(context).requestFocus(
                                          confirmPasswordFocusNode);
                                      setState(() {
                                        autovalidateConfirmPassword = true;
                                      });
                                    },
                                    focusNode: passwordFocusNode,
                                    style:
                                        TextStyle(color: CognifeedColors.teal),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 18,
                                      ),
                                      errorText: "",
                                      suffixIcon: IconButton(
                                        icon: Icon(
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
                                      hintText: "Password",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  height: 80,
                                  child: TextFormField(
                                    autovalidate: autovalidateConfirmPassword,
                                    onTap: () {
                                      setState(() {
                                        autovalidateConfirmPassword = true;
                                      });
                                    },
                                    validator: (val) {
                                      if (val != _passwordController.text) {
                                        return "Confirm password doesn't match.";
                                      }
                                      return null;
                                    },
                                    controller: _confirmPasswordController,
                                    obscureText: obscureConfirmPassword,
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      setState(() {
                                        autoValidateEmail = true;
                                      });
                                    },
                                    focusNode: confirmPasswordFocusNode,
                                    style:
                                        TextStyle(color: CognifeedColors.teal),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        size: 18,
                                      ),
                                      errorText: "",
                                      suffixIcon: Container(
                                        height: 17,
                                        width: 17,
                                        child: FlatButton(
                                          shape: CircleBorder(),
                                          child: Icon(
                                            obscureConfirmPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 17,
                                            color: CognifeedColors.teal,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscureConfirmPassword =
                                                  !obscureConfirmPassword;
                                            });
                                          },
                                        ),
                                      ),
                                      hintText: "Confirm Password",
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 15),
                                Container(
                                  height: 33,
                                  width: 127,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text("Sign Up",
                                        style: CognifeedTypography.textStyle4
                                            .copyWith(color: Colors.white)),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _onSignUpPressed();
                                      }
                                    },
                                    color: CognifeedColors.aquaMarine,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have an account?",
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
                                  child: Text("Log In",
                                      style: CognifeedTypography.textStyle4
                                          .copyWith(color: Colors.white)),
                                  onPressed: widget.onChangedScreen,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 20,
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
                );
              }),
        ),
      ),
    );
  }
}
