import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';

class ApplicationScaffold extends StatelessWidget {
  final Widget child;
  const ApplicationScaffold({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Cognifeed",
          style: CognifeedTypography.textStyle1,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesome.lightbulb_o),
            onPressed: () {},
          )
        ],
      ),
      body: child,
    );
  }
}
