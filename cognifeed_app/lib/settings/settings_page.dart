import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/home/onboarding_page.dart';
import 'package:cognifeed_app/profile/change_password_page.dart';
import 'package:cognifeed_app/profile/edit_profile.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsPage extends StatefulWidget {
  static const route = '/setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TimeOfDay _time = TimeOfDay.now();
  bool isTagsDisabled = true;
  bool isTimerDisabled = true;

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
      context: context,
      initialTime: _time,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffff5a5f),
        child: Icon(
          FontAwesome.power_off,
          color: Colors.white,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.white,
                        child: Container(
                          height: 105,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      child: Text(
                                        Cognifeed.loggedInUser.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        Cognifeed.loggedInUser.bio ??
                                            "Add your bio!",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                icon: Icon(
                                  FontAwesome5Solid.edit,
                                  color: Color(0xffff5a5f),
                                  size: 25,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfile(
                                        profileResponseModel:
                                            ProfileResponseModel(
                                          about: Cognifeed.loggedInUser.about,
                                          imageUrl:
                                              Cognifeed.loggedInUser.imageUrl,
                                          name: Cognifeed.loggedInUser.name,
                                          address:
                                              Cognifeed.loggedInUser.address,
                                          phone: Cognifeed.loggedInUser.phone,
                                          website:
                                              Cognifeed.loggedInUser.website,
                                          bio: Cognifeed.loggedInUser.bio,
                                          email: Cognifeed.loggedInUser.email,
                                          joinedDate:
                                              Cognifeed.loggedInUser.joinedDate,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: CachedNetworkImageProvider(
                            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesome5Solid.key,
                    color: Color(0xffff5a5f),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Change general tag preference",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesome5.check_square,
                    color: Color(0xffff5a5f),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Text(
              "Notification Settings",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SwitchListTile(
              activeColor: Color(0xffff5a5f),
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text("Receive notification"),
              onChanged: (val) {
                setState(() {
                  if (val)
                    isTimerDisabled = false;
                  else
                    isTimerDisabled = !isTimerDisabled;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Set timer for Push Notification"),
                IconButton(
                    icon: Icon(
                      FontAwesome5Solid.clock,
                      color: isTimerDisabled ? Colors.grey : Color(0xffff5a5f),
                    ),
                    onPressed: isTimerDisabled
                        ? null
                        : () {
                            setState(() {
                              selectTime(context);
                            });
                          }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "00",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "35",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "PM",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SwitchListTile(
              activeColor: Color(0xffff5a5f),
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text("Receive articles only from selected tags"),
              onChanged: (val) {
                setState(() {
                  if (val)
                    isTagsDisabled = false;
                  else
                    isTagsDisabled = !isTagsDisabled;
                });
              },
            ),
            RaisedButton(
              disabledColor: Colors.grey,
              color: Color(0xffff5a5f),
              onPressed: isTagsDisabled
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage(),
                        ),
                      );
                    },
              child: Text(
                'Select Tags',
                style: TextStyle(
                  fontSize: 16,
                  color: isTagsDisabled ? Colors.black : Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}
