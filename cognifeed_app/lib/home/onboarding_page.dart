import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
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
                  margin: EdgeInsets.fromLTRB(21, 48, 20, 0),
                  width: 334,
                  height: 762,
                  child: Image.asset(
                    "assets/images/onboardingBg.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        .png",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 56),
                          height: 64,
                          width: MediaQuery.of(context).size.width - 29,
                          decoration: BoxDecoration(
                            color: Color(0xffe9fdfc),
                            boxShadow: [
                              BoxShadow(blurRadius: 6, offset: Offset(8, 0)),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(19),
                                topLeft: Radius.circular(19)),
                          ),
                          padding: EdgeInsets.fromLTRB(100, 8, 98, 7),
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: 148,
                            height: 49,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 22),
                            height: 53,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: Color(0xffe9fdfc).withOpacity(0.66),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 6,
                                    offset: Offset(8, 10),
                                    color: Colors.black.withOpacity(0.16)),
                              ],
                            ),
                            padding: EdgeInsets.fromLTRB(103, 15, 96, 13),
                            child: Text(
                              'Make your choices!',
                              style:
                                  CognifeedTypography.textStyleOnboardHeading,
                            ))
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
