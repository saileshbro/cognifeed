import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const route = "/profile";
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      child: Container(
        child: Center(
          child: Text(ProfilePage.route),
        ),
      ),
    );
  }
}
