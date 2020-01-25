import 'dart:ui';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cognifeed_app/constants/Tags.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
                  margin: EdgeInsets.fromLTRB(21, 18, 10, 0),
                  width: 372,
                  height: 660,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.12),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(19))),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    CognifeedOnboard(),
                    MakeChoices(),
                    SearchBox(),
                    Tags(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      height: 2,
                      width: 370,
                      color: Color(0xff00c9c3),
                    ),
                    ShowMore(),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 18, 10, 0),
                      width: 372,
                      height: 74.5,
                      color: Colors.white.withOpacity(0.35),
                      child: Stack(
                        children: <Widget>[
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          ),
                          SaveButton(),
                        ],
                      ),
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

class CognifeedOnboard extends StatelessWidget {
  const CognifeedOnboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 26),
          height: 64,
          width: MediaQuery.of(context).size.width - 29,
          decoration: BoxDecoration(
            color: Color(0xff192965).withOpacity(0.66),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19), topLeft: Radius.circular(19)),
          ),
          padding: EdgeInsets.fromLTRB(100, 8, 98, 7),
          child: SvgPicture.asset(
            "assets/images/logo.svg",
            width: 148,
            height: 49,
          ),
        )
      ],
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 22),
          height: 53,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            color: Color(0xffe9fdfc).withOpacity(0.5),
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
            style: CognifeedTypography.textStyleOnboardHeading,
          ),
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 22, left: 22, right: 20),
              height: 83,
              width: 369,
              decoration: BoxDecoration(
                color: Color(0xff192965).withOpacity(0.66),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(8, 10),
                      color: Colors.black.withOpacity(0.16)),
                ],
              ),
              padding: EdgeInsets.fromLTRB(103, 15, 96, 13),
            ),
          ],
        ),
        SearchInput(),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 44),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 2,
            width: 80,
            color: Color(0xff00c9c3),
          ),
          Container(
            height: 40,
            width: 280,
            decoration: BoxDecoration(
              color: Color(0xffe9fdfc),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xff00c9c3), width: 1),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for tags...',
                  hintStyle: CognifeedTypography.tags),
            ),
          ),
          Container(
            height: 2,
            width: 50,
            color: Color(0xff00c9c3),
          )
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22, left: 35, right: 35),
      height: 315,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        direction: Axis.horizontal,
        children: tags.map((title) => TagWidget(tag: title)).toList(),
      ),
    );
  }
}

class ShowMore extends StatelessWidget {
  const ShowMore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            'Show more',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              color: Color(0xff00c9c3),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          "assets/images/next.png",
          height: 25,
          color: Color(0xff00c9c3),
        )
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
        Container(
          margin: EdgeInsets.only(top: 25, left: 50),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 4),
          child: Text(
            'Save',
            style: CognifeedTypography.tags
                .copyWith(fontSize: 17, color: Color(0xffe9fdfc)),
          ),
          decoration: BoxDecoration(
            color: Color(0xff192965).withOpacity(0.85),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}

class TagWidget extends StatefulWidget {
  String tag;
  TagWidget({
    Key key,
    this.tag,
  }) : super(key: key);

  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  IconMaker selectedIconMaker = IconMaker.add;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: selectedIconMaker == IconMaker.add
          ? BoxDecoration(
              color: Color(0xffe9fdfc).withOpacity(0.66),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xff00c9c3), width: 2),
            )
          : BoxDecoration(
              color: Color(0xff192965).withOpacity(0.66),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xffe9fdfc), width: 2),
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.tag,
            style: selectedIconMaker == IconMaker.add
                ? CognifeedTypography.tags
                : CognifeedTypography.tags.copyWith(color: Color(0xffe9fdfc)),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIconMaker == IconMaker.add
                    ? selectedIconMaker = IconMaker.saved
                    : selectedIconMaker = IconMaker.add;
              });
            },
            child:
                selectedIconMaker == IconMaker.add ? AddIcon() : CheckedIcon(),
          ),
        ],
      ),
    );
  }
}

class AddIcon extends StatelessWidget {
  const AddIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add_circle,
      size: 25,
      color: Color(0xff192965),
    );
  }
}

class CheckedIcon extends StatelessWidget {
  const CheckedIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle,
      size: 25,
      color: Color(0xffe9fdfc),
    );
  }
}

enum IconMaker { add, saved }
