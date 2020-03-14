import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';

class NotFound404 extends StatelessWidget {
  const NotFound404({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/404.png',
          ),
          Text(
            "Not Found !!",
            style: CognifeedTypography.large.copyWith(
              color: CognifeedColors.coralPink,
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
