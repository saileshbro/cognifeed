import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/home/onboarding_page.dart';
import 'package:cognifeed_app/profile/change_password_page.dart';
import 'package:cognifeed_app/profile/edit_profile.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/profile/profile_response_model.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsPage extends StatefulWidget {
  static const route = '/setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay newTime;
  bool isTagsEnabled = false;
  bool isTimerEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      actions: <Widget>[
        IconButton(
          icon: Icon(BlocProvider.of<ThemeBloc>(context).isDarkTheme
              ? FontAwesome.sun_o
              : FontAwesome.moon_o),
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(
                BlocProvider.of<ThemeBloc>(context).isDarkTheme
                    ? LightThemeEvent()
                    : DarkThemeEvent());
          },
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/');
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        },
        backgroundColor: Color(0xffff5a5f),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesome.power_off,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(
                          color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                              ? Color(0xff1b1b1b)
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 180,
                                        child: Text(
                                          Cognifeed.loggedInUser.name ?? "",
                                          style: TextStyle(
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
                                    color: CognifeedColors.coralPink,
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
                                            joinedDate: Cognifeed
                                                .loggedInUser.joinedDate,
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
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                          ? Color(0xff1b1b1b)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                          ? []
                          : [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.37),
                                blurRadius: 4,
                              )
                            ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                          ),
                        ),
                        SwitchListTile(
                          activeColor: Color(0xffff5a5f),
                          contentPadding: const EdgeInsets.all(0),
                          value: isTimerEnabled,
                          title: Text("Receive notification"),
                          onChanged: (val) {
                            setState(() {
                              isTimerEnabled = !isTimerEnabled;
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
                                  color: !isTimerEnabled
                                      ? Colors.grey
                                      : Color(0xffff5a5f),
                                ),
                                onPressed: !isTimerEnabled
                                    ? null
                                    : () async {
                                        newTime = await showTimePicker(
                                          context: context,
                                          initialTime: _time,
                                        );
                                        setState(() {
                                          if (newTime is TimeOfDay)
                                            _time = newTime;
                                        });
                                      }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _time.hourOfPeriod.toString(),
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
                              _time.minute.toString(),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              _time.period.index == 0 ? "AM" : "PM",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60.0),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Container(
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
                          Cognifeed.loggedInUser.imageUrl ?? ""),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
