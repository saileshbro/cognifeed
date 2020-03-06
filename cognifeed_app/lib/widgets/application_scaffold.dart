import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';
import '../constants/cognifeed_constants.dart';
import '../constants/cognifeed_constants.dart';
import '../constants/cognifeed_constants.dart';

class ApplicationScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      drawer: !isOnBoarding ? ApplicationDrawer() : null,
      appBar: AppBar(
        title: Text(
          title,
          style: CognifeedTypography.textStyle1,
        ),
        centerTitle: true,
        actions: isOnBoarding
            ? null
            : <Widget>[
                IconButton(
                  icon: Icon(FontAwesome.lightbulb_o),
                  onPressed: () {},
                ),
              ],
      ),
      body: child,
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
              "Sailesh Dahal",
              style: CognifeedTypography.articleTitle.copyWith(fontSize: 20),
            ),
            accountEmail: Text(
              'saileshbro@gmail.com',
              style: CognifeedTypography.articleDescription,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.3),
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
              onTap: () {},
            ),
          ),
          ListTile(
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
            onTap: () {},
          ),
          ListTile(
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
            onTap: () {},
          ),
          ListTile(
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
