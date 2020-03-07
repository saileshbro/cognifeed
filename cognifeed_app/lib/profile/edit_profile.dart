import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/profile/change_password_page.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';
import 'change_profile_page.dart';

class EditProfile extends StatefulWidget {
  final ProfileResponseModel profileResponseModel;

  const EditProfile({this.profileResponseModel});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    print(widget.profileResponseModel.toJson().toString());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.save,
          size: 18,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "ProfilePic",
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: Theme(
                data: customFormField(),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Feather.lock,
                                size: 18,
                                color: Colors.black,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1.6),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ModifyImage()));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Feather.camera,
                                size: 18,
                                color: Colors.black,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Change Profile",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1.6),
                              ),
                              Text(
                                "Image",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1.6),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesome.pencil_square_o,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Occupation",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Feather.briefcase,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Address",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Feather.map,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesome.envelope_o,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Feather.phone,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Website",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.web_asset,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: TextFormField(
                        maxLines: 7,
                        decoration: InputDecoration(
                          hintText: "About",
                          prefix: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Icon(
                              Feather.user_plus,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      // height: 0,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text("Joined Date"),
                      subtitle: Text("15 February 2019"),
                      leading: Icon(
                        Feather.calendar,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
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
