import 'dart:ui';

import 'package:cognifeed_app/application_wrapper.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/widgets/TagWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ShowAllTags extends StatefulWidget {
  @override
  _ShowAllTagsState createState() => _ShowAllTagsState();
}

class _ShowAllTagsState extends State<ShowAllTags> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: SizedBox.shrink(),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: -20,
              top: 0,
              bottom: -10,
              left: -2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/onboarding.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(21, 10, 10, 0),
                  width: 372,
                  height: 800,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.12),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    MakeChoices(),
                    SizedBox(
                      height: 20,
                    ),
                    Tags(),
                    SizedBox(
                      height: 15,
                    ),
                    SaveButton(),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MakeChoices extends StatelessWidget {
  const MakeChoices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 53,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Color(0xffe9fdfc).withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  offset: Offset(8, 10),
                  color: Colors.black.withOpacity(0.16)),
            ],
          ),
          padding: EdgeInsets.fromLTRB(80, 10, 80, 13),
          child: Text(
            'Make your choices!',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              color: Color(0xff192965),
            ),
          ),
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => ApplicationWrapper()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 4),
            child: Text(
              'Save',
              style:
                  CognifeedTypography.tags.copyWith(color: Color(0xffe9fdfc)),
            ),
            decoration: BoxDecoration(
              color: Color(0xff192965),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
