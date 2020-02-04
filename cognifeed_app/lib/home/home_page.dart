import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/Models/articlemodel.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 0.0;

  ScrollController _listViewController;
  @override
  void initState() {
    _listViewController = ScrollController()
      ..addListener(() {
        setState(() {
          sliderValue = _listViewController.offset /
              _listViewController.position.maxScrollExtent;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9FDFC).withOpacity(0.5),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/home.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Hello(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 60),
                    child: ListView.builder(
                      controller: _listViewController,
                      itemBuilder: (BuildContext context, int index) {
                        return ArticleBox(
                          title: articles[index].title,
                          imageUrl: articles[index].imageUrl,
                          category: articles[index].category,
                          description: articles[index].description,
                          isFavourite: articles[index].isFavourite,
                        );
                      },
                      itemCount: articles.length,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 80,
              bottom: 55,
              left: -5,
              child: RotatedBox(
                quarterTurns: 1,
                child: SliderTheme(
                  data: SliderThemeData(
                      activeTrackColor: Color(0xff192965),
                      inactiveTrackColor: Color(0xff192965),
                      thumbShape: CustomThumbShape()),
                  child: Slider(
                    max: 1,
                    min: 0,
                    value: sliderValue,
                    onChanged: (i) {
                      setState(() {
                        sliderValue = i;
                        _listViewController.jumpTo(
                            _listViewController.position.maxScrollExtent * i);
                      });
                    },
                  ),
                ),
              ),
            )
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
            height: 70,
            width: MediaQuery.of(context).size.width - 10,
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
                HelloText(),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Here are articles for you!',
                  style: CognifeedTypography.textStyleOnboardHeading.copyWith(
                    color: Color(0xff192965),
                    fontWeight: FontWeight.w600,
                    wordSpacing: 1.5,
                  ),
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
      child: Column(
        children: <Widget>[
          Text(
            'Hello',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              color: Color(0xff01796f),
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
          Text(
            ' Sarayu',
            style: CognifeedTypography.textStyleOnboardHeading.copyWith(
              fontSize: 22,
              color: Color(0xff192965),
            ),
          )
        ],
      ),
    );
  }
}

class ArticleBox extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  bool isFavourite;

  ArticleBox({
    @required this.category,
    @required this.description,
    @required this.imageUrl,
    @required this.title,
    @required this.isFavourite,
    Key key,
  }) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20, right: 5),
          padding: EdgeInsets.all(8),
          height: widget.title.length <= 35
              ? 522
              : widget.title.length <= 70 ? 542 : 572,
          width: 369,
          decoration: BoxDecoration(
              color: Color(0xffe9fdfc).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(
                width: 3,
                color: Color(0xff192965),
              )),
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: 369,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff004844),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: 40,
                    ),
                    Positioned(
                      left: 5,
                      top: 2,
                      child: Text(
                        widget.category,
                        style: CognifeedTypography.textStyle2.copyWith(
                          fontSize: 24,
                          color: Color(0xffe9fdfc),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 3,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.isFavourite = !widget.isFavourite;
                          });
                        },
                        child: Icon(
                          Icons.bookmark,
                          size: 35,
                          color: widget.isFavourite
                              ? Color(0xff00c9c3)
                              : Color(0xffe9fdfc),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: widget.title.length <= 35
                        ? 68
                        : widget.title.length <= 60 ? 88 : 118,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color(0xffe9fdfc),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: CognifeedTypography.title,
                          maxLines: 3,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          "assets/images/down.png",
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 182,
                    child: RichText(
                      strutStyle: StrutStyle(
                          fontFamily: GoogleFonts.crimsonText().fontFamily),
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: CognifeedTypography.searchBox.copyWith(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.description,
                          ),
                          TextSpan(
                            text: "Read Full Article",
                          ),
                        ],
                      ),
                    ),
                    // child: Text(
                    //   widget.description,
                    //   textAlign: TextAlign.justify,
                    //   maxLines: 6,
                    //   style: CognifeedTypography.searchBox
                    //       .copyWith(color: Colors.black),
                    // ),
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

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CustomThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final fillPaint = Paint()
      ..color = sliderTheme.activeTrackColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    canvas.drawLine(Offset(rect.left - 7, rect.bottom - 6),
        Offset(rect.left + 18, rect.bottom - 6), fillPaint);
  }
}
