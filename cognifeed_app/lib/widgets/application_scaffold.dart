import 'package:cognifeed_app/fav/fav_page.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/settings/settings_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../auth/authentication_bloc.dart';
import '../auth/authentication_events.dart';
import '../constants/cognifeed_constants.dart';
import '../constants/cognifeed_constants.dart';
import '../home/home_page.dart';

class ApplicationScaffold extends StatefulWidget {
  final Widget child;
  final bool isOnBoarding;
  final String title;
  final Widget floatingActionButton;
  final Color backgroundColor;
  const ApplicationScaffold(
      {Key key,
      @required this.child,
      this.floatingActionButton,
      this.isOnBoarding = false,
      this.backgroundColor,
      this.title = "Cognifeed"})
      : super(key: key);

  @override
  _ApplicationScaffoldState createState() => _ApplicationScaffoldState();
}

class _ApplicationScaffoldState extends State<ApplicationScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      drawer: !widget.isOnBoarding ? ApplicationDrawer() : null,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: CognifeedTypography.textStyle1,
        ),
        centerTitle: true,
        actions: widget.isOnBoarding
            ? null
            : <Widget>[
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
      ),
      body: widget.child,
    );
  }
}

class ApplicationDrawer extends StatefulWidget {
  const ApplicationDrawer({
    Key key,
  }) : super(key: key);

  @override
  _ApplicationDrawerState createState() => _ApplicationDrawerState();
}

class _ApplicationDrawerState extends State<ApplicationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              Cognifeed.loggedInUser.name,
              style: CognifeedTypography.articleTitle.copyWith(fontSize: 20),
            ),
            accountEmail: Text(
              Cognifeed.loggedInUser.email,
              style: CognifeedTypography.articleDescription,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Home),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Feather.home,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Home",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Home) {
                  Cognifeed.drawerPages = DrawerPages.Home;
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, HomePage.route);
                }
              },
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Fav),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  FontAwesome.heart_o,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Favourites",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Fav) {
                  Cognifeed.drawerPages = DrawerPages.Fav;
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, FavPage.route);
                }
              },
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Profile),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  FontAwesome.user_o,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Profile",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Profile) {
                  Cognifeed.drawerPages = DrawerPages.Profile;
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, ProfilePage.route);
                }
              },
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Settings),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Feather.settings,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Settings",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Settings) {
                  Cognifeed.drawerPages = DrawerPages.Settings;
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, SettingsPage.route);
                }
              },
            ),
          ),
          Container(
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Entypo.log_out,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Logout",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            ),
          ),
        ],
      ),
    );
  }

  getSelectedColor(DrawerPages page) {
    return page == Cognifeed.drawerPages ? Colors.grey.withOpacity(0.3) : null;
  }
}

enum DrawerPages { Home, Fav, Profile, Settings }
