import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  static const route = '/fav';
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      child: Container(
        child: Center(
          child: Text(FavPage.route),
        ),
      ),
    );
  }
}
