import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/helpers/customValidator.dart';
import 'package:cognifeed_app/profile/bloc/profile_bloc.dart';
import 'package:cognifeed_app/profile/bloc/profile_event.dart';
import 'package:cognifeed_app/profile/bloc/profile_state.dart';
import 'package:cognifeed_app/profile/bloc/update_profile_bloc.dart';
import 'package:cognifeed_app/profile/bloc/update_profile_event.dart';
import 'package:cognifeed_app/profile/bloc/update_profile_state.dart';
import 'package:cognifeed_app/profile/change_password_page.dart';
import 'package:cognifeed_app/profile/change_profile_page.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:cognifeed_app/profile/profile_update_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EditProfile extends StatefulWidget {
  final ProfileResponseModel profileResponseModel;

  const EditProfile({this.profileResponseModel});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formKey;
  TextEditingController _nameController;
  TextEditingController _bioController;
  TextEditingController _addressController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _websiteController;
  TextEditingController _aboutController;
  FocusNode _nameFocusNode;
  FocusNode _bioFocusNode;
  FocusNode _addressFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _phoneFocusNode;
  FocusNode _websiteFocusNode;
  FocusNode _aboutFocusNode;
  bool _nameAutoValidate = false;
  bool _bioAutoValidate = false;
  bool _addressAutoValidate = false;
  bool _emailAutoValidate = false;
  bool _phoneAutoValidate = false;
  bool _websiteAutoValidate = false;
  bool _aboutAutoValidate = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController =
        TextEditingController(text: widget.profileResponseModel.name);
    _bioController =
        TextEditingController(text: widget.profileResponseModel.bio);
    _addressController =
        TextEditingController(text: widget.profileResponseModel.address);
    _emailController =
        TextEditingController(text: widget.profileResponseModel.email);
    _phoneController =
        TextEditingController(text: widget.profileResponseModel.phone);
    _websiteController =
        TextEditingController(text: widget.profileResponseModel.website);
    _aboutController =
        TextEditingController(text: widget.profileResponseModel.about);
    _nameFocusNode = FocusNode();
    _bioFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _websiteFocusNode = FocusNode();
    _aboutFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _aboutController.dispose();
    _nameFocusNode.dispose();
    _bioFocusNode.dispose();
    _addressFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _websiteFocusNode.dispose();
    _aboutFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocListener<UpdateProfileBloc, UpdateProfileState>(
        bloc: BlocProvider.of<UpdateProfileBloc>(context),
        listener: (context, state) {
          if (state is ProfileUpdateErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is ProfileUpdateSuccessMessageState) {
            Cognifeed.loggedInUser.email = _emailController.text;
            Cognifeed.loggedInUser.name = _nameController.text;
            Cognifeed.loggedInUser.phone = _phoneController.text;
            Cognifeed.loggedInUser.address = _addressController.text;
            Cognifeed.loggedInUser.bio = _bioController.text;
            Cognifeed.loggedInUser.website = _websiteController.text;
            Cognifeed.loggedInUser.about = _aboutController.text;
            Cognifeed.pref.setString("email", _emailController.text);
            Cognifeed.pref.setString("name", _nameController.text);
            Cognifeed.pref.setString("phone", _phoneController.text);
            Cognifeed.pref.setString("address", _addressController.text);
            Cognifeed.pref.setString("bio", _bioController.text);
            Cognifeed.pref.setString("website", _websiteController.text);
            Cognifeed.pref.setString("about", _aboutController.text);
            BlocProvider.of<ProfileBloc>(context).add(GetProfileInfoEvent());
            Scaffold.of(context)
                .showSnackBar(
                  SnackBar(
                    content: Text('${state.message}'),
                    backgroundColor: Colors.green,
                  ),
                )
                .closed
                .then((val) => Navigator.of(context).pop());
          }
        },
        child: BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
            bloc: BlocProvider.of<UpdateProfileBloc>(context),
            builder: (context, state) {
              return FloatingActionButton(
                backgroundColor: CognifeedColors.coralPink,
                foregroundColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<UpdateProfileBloc>(context).add(
                      UpdateProfileClickedEvent(
                        model: UpdateProfileRequestModel(
                          about: _aboutController.text,
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          address: _addressController.text,
                          bio: _bioController.text,
                          website: _websiteController.text,
                        ),
                      ),
                    );
                  }
                },
                child: (state is ProfileFetchingState)
                    ? CircularProgressIndicator()
                    : Icon(
                        Icons.save,
                        size: 18,
                      ),
              );
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "ProfilePic",
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: Cognifeed.loggedInUser.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Feather.lock,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6),
                              )
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModifyImage()))
                              .then((onValue) {
                            setState(() {});
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Feather.camera,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Change Image",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1.6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _nameAutoValidate = true;
                              });
                            },
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                              setState(() {
                                _emailAutoValidate = true;
                              });
                            },
                            controller: _nameController,
                            autovalidate: _nameAutoValidate,
                            focusNode: _nameFocusNode,
                            validator: (val) => validateName(val),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Name",
                              prefixIcon: Icon(
                                FontAwesome.pencil_square_o,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _emailAutoValidate = true;
                              });
                            },
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_phoneFocusNode);
                              setState(() {
                                _phoneAutoValidate = true;
                              });
                            },
                            controller: _emailController,
                            validator: (val) => validateEmail(val),
                            keyboardType: TextInputType.emailAddress,
                            autovalidate: _emailAutoValidate,
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Email",
                              prefixIcon: Icon(
                                FontAwesome.envelope_o,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _phoneAutoValidate = true;
                              });
                            },
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_bioFocusNode);
                              setState(() {
                                _bioAutoValidate = true;
                              });
                            },
                            controller: _phoneController,
                            validator: (val) => validatePhone(val),
                            keyboardType: TextInputType.number,
                            autovalidate: _phoneAutoValidate,
                            focusNode: _phoneFocusNode,
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Phone",
                              prefixIcon: Icon(
                                Feather.phone,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _bioAutoValidate = true;
                              });
                            },
                            controller: _bioController,
                            autovalidate: _bioAutoValidate,
                            focusNode: _bioFocusNode,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_addressFocusNode);
                              setState(() {
                                _addressAutoValidate = true;
                              });
                            },
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Bio",
                              prefixIcon: Icon(
                                Feather.briefcase,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _addressAutoValidate = true;
                              });
                            },
                            controller: _addressController,
                            autovalidate: _addressAutoValidate,
                            focusNode: _addressFocusNode,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_websiteFocusNode);
                              setState(() {
                                _websiteAutoValidate = true;
                              });
                            },
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Address",
                              prefixIcon: Icon(
                                Feather.map,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _websiteAutoValidate = true;
                              });
                            },
                            controller: _websiteController,
                            autovalidate: _websiteAutoValidate,
                            focusNode: _websiteFocusNode,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_aboutFocusNode);
                              setState(() {
                                _aboutAutoValidate = true;
                              });
                            },
                            validator: (val) => validateWebsite(val),
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "Website",
                              prefixIcon: Icon(
                                Icons.web_asset,
                                size: 18,
                              ),
                            ),
                          ),
                          height: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _aboutAutoValidate = true;
                              });
                            },
                            controller: _aboutController,
                            autovalidate: _aboutAutoValidate,
                            focusNode: _aboutFocusNode,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                _emailAutoValidate = true;
                              });
                            },
                            decoration: InputDecoration(
                              errorText: "",
                              hintText: "About",
                              prefixIcon: Icon(
                                Feather.user_plus,
                                size: 18,
                              ),
                            ),
                          ),
                          // height: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Transform.translate(
                        offset: Offset(-25, 0), child: Text("Joined Date")),
                    subtitle: Transform.translate(
                        offset: Offset(-25, 0),
                        child: Text(
                            widget.profileResponseModel.joinedDate.toString())),
                    leading: Icon(
                      Feather.calendar,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
