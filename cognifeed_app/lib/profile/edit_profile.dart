import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';
import 'change_profile_page.dart';

class EditProfile extends StatefulWidget {
  static final String path = "lib/src/pages/profile/profile3.dart";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.save,
          size: 35,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 320,
              width: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                fit: BoxFit.cover,
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
                                    builder: (context) => ModifyImage()));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Feather.lock,
                                size: 30,
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
                                size: 30,
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
                    Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "About",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Icon(
                                  Feather.user_plus,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          height: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: TextFormField(),
                          height: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: TextFormField(),
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text("Joined Date"),
                      subtitle: Text("15 February 2019"),
                      leading: Icon(
                        Feather.calendar,
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

  ThemeData customFormField() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        helperStyle: TextStyle(color: Colors.black),
        contentPadding:
            EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 0),
        labelStyle: CognifeedTypography.articleDescription,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.65),
          fontSize: 15,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.orange,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffff5a5f),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
