import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/all_articles/all_articles_page.dart';
import 'package:cognifeed_app/auth/authentication_bloc.dart';
import 'package:cognifeed_app/auth/authentication_events.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/fav/fav_page.dart';
import 'package:cognifeed_app/hidden/hidden_page.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/profile/profile_page.dart';
import 'package:cognifeed_app/settings/settings_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ApplicationScaffold extends StatefulWidget {
  final Widget child;
  final bool showDrawer;
  final String title;
  final Widget floatingActionButton;
  final Color backgroundColor;
  final List<Widget> actions;

  const ApplicationScaffold(
      {Key key,
      @required this.child,
      this.floatingActionButton,
      this.showDrawer = true,
      this.actions,
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
      drawer: widget.showDrawer ? ApplicationDrawer() : null,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          widget.title,
          style: CognifeedTypography.large.copyWith(
            color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
        centerTitle: true,
        actions: widget.actions,
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
            // margin: EdgeInsets.only(top: 30),
            accountName: Text(
              Cognifeed.loggedInUser.name,
              style: CognifeedTypography.articleTitle.copyWith(fontSize: 18),
            ),
            accountEmail: Text(
              Cognifeed.loggedInUser.email,
              style: CognifeedTypography.articleDescription.copyWith(
                color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                    ? Colors.white.withOpacity(0.87)
                    : Colors.black.withOpacity(0.87),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  Cognifeed.loggedInUser.imageUrl ?? ""),
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Home),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Feather.home,
                  size: 18,
                ),
              ),
              title: Text(
                "Home",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                print("Press");
                if (Cognifeed.drawerPages != DrawerPages.Home) {
                  Cognifeed.drawerPages = DrawerPages.Home;
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(HomePage.route);
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
                  size: 18,
                ),
              ),
              title: Text(
                "Favourites",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Fav) {
                  Cognifeed.drawerPages = DrawerPages.Fav;
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(FavPage.route);
                }
              },
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.Hidden),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.highlight_off,
                  size: 18,
                ),
              ),
              title: Text(
                "Hidden",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Hidden) {
                  Cognifeed.drawerPages = DrawerPages.Hidden;
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(HiddenPage.route);
                }
              },
            ),
          ),
          Container(
            color: this.getSelectedColor(DrawerPages.All),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.note,
                  size: 18,
                ),
              ),
              title: Text(
                "All Articles",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.All) {
                  Cognifeed.drawerPages = DrawerPages.All;
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(AllArticlesPage.route);
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
                  size: 18,
                ),
              ),
              title: Text(
                "Profile",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Profile) {
                  Cognifeed.drawerPages = DrawerPages.Profile;
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(ProfilePage.route);
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
                  size: 18,
                ),
              ),
              title: Text(
                "Settings",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (Cognifeed.drawerPages != DrawerPages.Settings) {
                  Cognifeed.drawerPages = DrawerPages.Settings;
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(SettingsPage.route);
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
                  size: 18,
                ),
              ),
              title: Text(
                "Logout",
                style: CognifeedTypography.articleTitle.copyWith(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
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

enum DrawerPages { Home, Fav, Profile, Hidden, Settings, All }
