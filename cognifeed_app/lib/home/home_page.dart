import 'dart:ui';

import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cognifeed_app/constants/Tags.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Column(
              children: <Widget>[
                Hello(),
                ArticleBox(),
                // Container(
                //   margin: EdgeInsets.only(
                //     top: 10,
                //     bottom: 10,
                //   ),
                //   height: 2,
                //   width: 370,
                //   color: Color(0xff192965),
                // ),
                // SearchBox(),
                // Tags(),
                // ShowMore(),
                // Container(
                //   margin: EdgeInsets.fromLTRB(14, 18, 10, 0),
                //   width: 372,
                //   height: 74.5,
                //   color: Colors.white.withOpacity(0.35),
                //   child: Stack(
                //     children: <Widget>[
                //       BackdropFilter(
                //         filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                //       ),
                //       SaveButton(),
                //       ],
                //     ),
                //   ),
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
            margin: EdgeInsets.only(top: 22),
            height: 70,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
              color: Color(0xffe9fdfc).withOpacity(0.8),
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
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff192965),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                HelloText(),
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
      width: 90,
      child: RichText(
        text: TextSpan(
            text: 'Hello',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              color: Color(0xff01796f),
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Sarayu',
                style: CognifeedTypography.textStyleOnboardHeading.copyWith(
                  fontSize: 30,
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
      margin: EdgeInsets.only(top: 22, left: 42, right: 0),
      padding: EdgeInsets.all(8),
      height: 340,
      width: 369,
      decoration: BoxDecoration(
        color: Color(0xff00c9c3).withOpacity(0.4),
        border: Border(
          bottom: BorderSide(color: Color(0xffe9fdfc), width: 2),
          right: BorderSide(color: Color(0xffe9fdfc), width: 6),
          top: BorderSide(color: Color(0xffe9fdfc), width: 2),
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
                    color: Color(0xff192965).withOpacity(0.2),
                    border: Border.all(
                        color: Color(0xff192965).withOpacity(0.4), width: 2),
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
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      'Make your choices!hahahahahahahahahahahahahahahahahahahahahahahaha',
                      style: CognifeedTypography.tags.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color(0xffe9fdfc).withOpacity(0.5),
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
      Icons.favorite,
      size: 50,
      color: Color(0xff4B0081),
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
      Icons.favorite,
      size: 50,
      color: Color(0xffe9fdfc),
    );
  }
}

enum IconMaker { add, remove }

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
                    ? selectedIconMaker = IconMaker.remove
                    : selectedIconMaker = IconMaker.add;
              });
            },
            child:
                selectedIconMaker == IconMaker.add ? AddIcon() : RemoveIcon(),
          ),
        ],
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
