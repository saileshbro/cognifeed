import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const route = '/setting';
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      child: Container(
        child: Center(
          child: Text(SettingsPage.route),
        ),
      ),
    );
  }
}
