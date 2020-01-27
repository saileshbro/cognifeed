import 'dart:ui';
import 'package:cognifeed_app/Models/articlemodel.dart';
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
    final navbar = MediaQuery.of(context).size.width - 140;
    ColorMaker selectedColorMaker = ColorMaker.setting;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
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
            Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Hello(),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 585,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ArticleBox(
                            title: articles[index].title,
                            imageUrl: articles[index].imageUrl,
                            category: articles[index].category,
                            description: articles[index].description,
                          );
                        },
                        itemCount: articles.length,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff004844).withOpacity(0.7),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 70,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff00c9c3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xff00c9c3),
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 0.25 * navbar,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius:
                                selectedColorMaker == ColorMaker.setting
                                    ? BorderRadius.all(Radius.circular(20))
                                    : BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                            color: selectedColorMaker == ColorMaker.home
                                ? Color(0xff00c9c3)
                                : Color(0xff004844),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorMaker = ColorMaker.home;
                              });
                            },
                            child: Icon(
                              Icons.home,
                              size: 30,
                              color: selectedColorMaker == ColorMaker.home
                                  ? Color(0xff192965)
                                  : Color(0xff00c9c3),
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: selectedColorMaker == ColorMaker.home
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )
                                : selectedColorMaker == ColorMaker.bookmark
                                    ? BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )
                                    : BorderRadius.zero,
                            color: selectedColorMaker == ColorMaker.setting
                                ? Color(0xff00c9c3)
                                : Color(0xff004844),
                          ),
                          width: 0.25 * navbar,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorMaker = ColorMaker.setting;
                              });
                            },
                            child: Icon(
                              Icons.menu,
                              size: 30,
                              color: selectedColorMaker == ColorMaker.setting
                                  ? Color(0xff192965)
                                  : Color(0xff00c9c3),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.25 * navbar,
                          decoration: BoxDecoration(
                            borderRadius:
                                selectedColorMaker == ColorMaker.setting
                                    ? BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      )
                                    : selectedColorMaker == ColorMaker.people
                                        ? BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          )
                                        : BorderRadius.zero,
                            color: selectedColorMaker == ColorMaker.bookmark
                                ? Color(0xff00c9c3)
                                : Color(0xff004844),
                          ),
                          height: 55,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorMaker = ColorMaker.bookmark;
                              });
                            },
                            child: Icon(
                              Icons.bookmark,
                              size: 30,
                              color: selectedColorMaker == ColorMaker.bookmark
                                  ? Color(0xff192965)
                                  : Color(0xff00c9c3),
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 0.25 * navbar,
                          decoration: BoxDecoration(
                            borderRadius:
                                selectedColorMaker == ColorMaker.bookmark
                                    ? BorderRadius.all(
                                        Radius.circular(20),
                                      )
                                    : BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                            color: selectedColorMaker == ColorMaker.people
                                ? Color(0xff00c9c3)
                                : Color(0xff004844),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorMaker = ColorMaker.people;
                              });
                            },
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: selectedColorMaker == ColorMaker.people
                                  ? Color(0xff192965)
                                  : Color(0xff00c9c3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 60,
                    width: navbar + 8,
                  ),
                )
              ],
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
              color: Color(0xffe9fdfc).withOpacity(0.7),
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
                      color: Color(0xff01796f),
                      fontWeight: FontWeight.w600,
                      wordSpacing: 1.5,
                      letterSpacing: 1),
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
  final String title;
  final String description;
  final String imageUrl;
  final String category;

  const ArticleBox({
    @required this.category,
    @required this.description,
    @required this.imageUrl,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  IconMaker selectedIconMaker = IconMaker.add;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(8),
          height: widget.title.length <= 35
              ? 447
              : widget.title.length <= 70 ? 467 : 487,
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
                    Image.network(
                      widget.imageUrl,
                      // "assets/images/rose.png",
                      fit: BoxFit.cover,
                      height: 250,
                      width: 369,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      color: Color(0xff004844),
                    ),
                    Positioned(
                      left: 5,
                      child: RichText(
                        text: TextSpan(
                            text: '#  ',
                            style: CognifeedTypography.textStyleOnboardHeading
                                .copyWith(
                              color: Color(0xffe9fdfc),
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.category,
                                // text: ' Adventure',
                                style: CognifeedTypography
                                    .textStyleOnboardHeading
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
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: widget.title.length <= 35
                        ? 35
                        : widget.title.length <= 70 ? 60 : 85,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color(0xffe9fdfc),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      widget.title,
                      style: CognifeedTypography.title,
                      maxLines: 3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 130,
                    child: Text(
                      widget.description,
                      maxLines: 4,
                      style: CognifeedTypography.searchBox
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
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
      color: Color(0xff5E080A),
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
enum ColorMaker { home, setting, bookmark, people }
