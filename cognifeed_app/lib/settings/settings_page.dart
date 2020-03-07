import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/home/onboarding_page.dart';
import 'package:cognifeed_app/profile/edit_profile.dart';
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
                          height: 80,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "John Doe",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Computer Engineer",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
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
                                      builder: (context) => EditProfile(),
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
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: CachedNetworkImageProvider(
                          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
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
                    onPressed: isTimerDisabled
                        ? null
                        : () {
                            setState(() {
                              selectTime(context);
                            });
                          }),
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
                      Feather.clock,
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
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}
