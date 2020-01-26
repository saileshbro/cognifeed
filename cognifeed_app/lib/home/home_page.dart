import 'dart:ui';

import 'package:cognifeed_app/constants/Navigation.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allNavigations.map((Navigation navigation) {
          return BottomNavigationBarItem(
              icon: Icon(
            navigation.icon,
          ));
        }).toList(),
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: -5,
              top: -10,
              bottom: -10,
              left: -20,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/home.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Hello(),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 550,
                        width: 3,
                        color: Colors.black,
                      ),
                      ArticleBox(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Color(0xff004844),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hello extends StatelessWidget {
  const Hello({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 10),
            height: 60,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
              color: Color(0xffe9fdfc).withOpacity(0.66),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(8, 10),
                    color: Colors.black.withOpacity(0.16)),
              ],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(25)),
            ),
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff192965),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                HelloText(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Here are articles for you!',
                  style: CognifeedTypography.textStyleOnboardHeading.copyWith(
                      color: Color(0xff01796f), fontWeight: FontWeight.w600),
                ),
              ],
            ))
      ],
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: RichText(
        text: TextSpan(
            text: 'Hello',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              color: Color(0xff01796f),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Sarayu',
                style: CognifeedTypography.textStyleOnboardHeading.copyWith(
                  fontSize: 25,
                ),
              )
            ]),
      ),
    );
  }
}

class ArticleBox extends StatefulWidget {
  const ArticleBox({
    Key key,
  }) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  IconMaker selectedIconMaker = IconMaker.add;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 0, right: 0),
      padding: EdgeInsets.all(8),
      height: 342,
      width: 369,
      decoration: BoxDecoration(
        color: Color(0xffe9fdfc).withOpacity(0.3),
        border: Border(
          bottom: BorderSide(color: Color(0xff192965), width: 3),
          right: BorderSide(color: Color(0xff192965), width: 8),
          top: BorderSide(color: Color(0xff192965), width: 3),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/rose.png",
                  fit: BoxFit.cover,
                  width: 369,
                ),
                Container(
                  width: 369,
                  decoration: BoxDecoration(
                    color: Color(0xff01796f).withOpacity(0.2),
                    border: Border.all(
                        color: Color(0xff192965).withOpacity(0.4), width: 2),
                  ),
                ),
                Positioned(
                  child: RichText(
                    text: TextSpan(
                        text: '#',
                        style: CognifeedTypography.textStyleOnboardHeading
                            .copyWith(
                          color: Color(0xffe9fdfc),
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Adventure',
                            style: CognifeedTypography.textStyleOnboardHeading
                                .copyWith(
                              fontSize: 25,
                              color: Color(0xffe9fdfc),
                            ),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIconMaker == IconMaker.add
                            ? selectedIconMaker = IconMaker.remove
                            : selectedIconMaker = IconMaker.add;
                      });
                    },
                    child: selectedIconMaker == IconMaker.add
                        ? AddIcon()
                        : RemoveIcon(),
                  ),
                ),
                Positioned(
                  top: 125,
                  right: 0,
                  child: Container(
                    height: 75,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Color(0xffe9fdfc).withOpacity(0.6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              offset: Offset(8, 10),
                              color: Colors.black.withOpacity(0.16)),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      'Make your choices!hahahahahahahahahahahahahahahahahahahahahahahaha',
                      style: CognifeedTypography.title,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 90,
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry Ipsum has been the industry ',
              style:
                  CognifeedTypography.searchBox.copyWith(color: Colors.black),
            ),
          )
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
      Icons.bookmark,
      size: 40,
      color: Color(0xffDB197D),
    );
  }
}

class RemoveIcon extends StatelessWidget {
  const RemoveIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.bookmark,
      size: 40,
      color: Color(0xffe9fdfc),
    );
  }
}

enum IconMaker { add, remove }
