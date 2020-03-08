// import 'dart:math';
// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cognifeed_app/Models/articlemodel.dart';
// import 'package:cognifeed_app/constants/cognifeed_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double sliderValue = 0.0;

//   ScrollController _listViewController;
//   @override
//   void initState() {
//     _listViewController = ScrollController()
//       ..addListener(() {
//         setState(() {
//           sliderValue = _listViewController.offset /
//               _listViewController.position.maxScrollExtent;
//         });
//       });
//     super.initState();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return SafeArea(
//   //     child: Scaffold(
//   //       backgroundColor: Color(0xffE9FDFC).withOpacity(0.5),
//   //       resizeToAvoidBottomInset: false,
//   //       appBar:
//   //           PreferredSize(preferredSize: Size(0, 0), child: SizedBox.shrink()),
//   //       body: AnnotatedRegion(
//   //         value: SystemUiOverlayStyle(
//   //           statusBarColor: Colors.transparent,
//   //         ),
//   //         child: Stack(
//   //           fit: StackFit.expand,
//   //           children: <Widget>[
//   //             Positioned(
//   //               right: -5,
//   //               top: -10,
//   //               bottom: -10,
//   //               left: -20,
//   //               child: Container(
//   //                 height: MediaQuery.of(context).size.height,
//   //                 width: MediaQuery.of(context).size.width,
//   //                 decoration: BoxDecoration(
//   //                   image: DecorationImage(
//   //                     image: AssetImage(
//   //                       "assets/images/home.png",
//   //                     ),
//   //                     fit: BoxFit.cover,
//   //                   ),
//   //                 ),
//   //                 child: BackdropFilter(
//   //                   filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//   //                   child: Container(
//   //                     color: Colors.white.withOpacity(0.3),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             Column(
//   //               mainAxisSize: MainAxisSize.min,
//   //               children: <Widget>[
//   //                 Hello(),
//   //                 Expanded(
//   //                   child: Container(
//   //                     margin: EdgeInsets.only(top: 15, bottom: 60),
//   //                     child: ListView.builder(
//   //                       controller: _listViewController,
//   //                       itemBuilder: (BuildContext context, int index) {
//   //                         return ArticleBox(
//   //                           title: articles[index].title,
//   //                           imageUrl: articles[index].imageUrl,
//   //                           category: articles[index].category,
//   //                           description: articles[index].description,
//   //                           isFavourite: articles[index].isFavourite,
//   //                         );
//   //                       },
//   //                       itemCount: articles.length,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //             Positioned(
//   //               top: 80,
//   //               bottom: 55,
//   //               left: -5,
//   //               child: RotatedBox(
//   //                 quarterTurns: 1,
//   //                 child: SliderTheme(
//   //                   data: SliderThemeData(
//   //                       activeTrackColor: Color(0xff192965),
//   //                       inactiveTrackColor: Color(0xff192965),
//   //                       thumbShape: CustomThumbShape()),
//   //                   child: Slider(
//   //                     max: 1,
//   //                     min: 0,
//   //                     value: sliderValue,
//   //                     onChanged: (i) {
//   //                       setState(() {
//   //                         sliderValue = i;
//   //                         _listViewController.jumpTo(
//   //                             _listViewController.position.maxScrollExtent * i);
//   //                       });
//   //                     },
//   //                   ),
//   //                 ),
//   //               ),
//   //             )
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container();
//   }
// }

// class Hello extends StatelessWidget {
//   const Hello({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Container(
//             margin: EdgeInsets.only(top: 10),
//             height: 70,
//             width: MediaQuery.of(context).size.width - 10,
//             padding: EdgeInsets.only(left: 20),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   height: 50,
//                   width: 3,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Color(0xff192965),
//                   ),
//                 ),
//                 HelloText(),
//                 SizedBox(
//                   width: 25,
//                 ),
//                 Text(
//                   'Here are articles for you!',
//                   style: CognifeedTypography.textStyleOnboardHeading.copyWith(
//                     color: Color(0xff192965),
//                     fontWeight: FontWeight.w600,
//                     wordSpacing: 1.5,
//                   ),
//                 ),
//               ],
//             ))
//       ],
//     );
//   }
// }

// class HelloText extends StatelessWidget {
//   const HelloText({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       child: Column(
//         children: <Widget>[
//           Text(
//             'Hello',
//             style: CognifeedTypography.textStyleOnboardHeading.copyWith(
//               color: Color(0xff01796f),
//               fontWeight: FontWeight.w600,
//               fontSize: 26,
//             ),
//           ),
//           Text(
//             ' Sarayu',
//             style: CognifeedTypography.textStyleOnboardHeading.copyWith(
//               fontSize: 22,
//               color: Color(0xff192965),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ArticleBox extends StatefulWidget {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final String category;
//   bool isFavourite;

//   ArticleBox({
//     @required this.category,
//     @required this.description,
//     @required this.imageUrl,
//     @required this.title,
//     @required this.isFavourite,
//     Key key,
//   }) : super(key: key);

//   @override
//   _ArticleBoxState createState() => _ArticleBoxState();
// }

// class _ArticleBoxState extends State<ArticleBox> {
//   double animatedHeight = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         AnimatedContainer(
//           margin: EdgeInsets.only(bottom: 20, right: 5),
//           padding: EdgeInsets.all(8),
//           height: widget.title.length <= 35
//               ? 340 + animatedHeight
//               : widget.title.length <= 70
//                   ? 360 + animatedHeight
//                   : 390 + animatedHeight,
//           width: 369,
//           decoration: BoxDecoration(
//               color: Color(0xffe9fdfc).withOpacity(0.3),
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               border: Border.all(
//                 width: 3,
//                 color: Color(0xff192965),
//               )),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       height: 250,
//                       width: 369,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                         ),
//                         child: CachedNetworkImage(
//                           imageUrl: widget.imageUrl,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Color(0xffe9fdfc),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                       height: 40,
//                     ),
//                     Positioned(
//                       left: 5,
//                       top: 2,
//                       child: Text(
//                         widget.category,
//                         style: CognifeedTypography.textStyle2.copyWith(
//                           fontSize: 24,
//                           color: Color(0xff192965),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 3,
//                       right: 5,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             widget.isFavourite = !widget.isFavourite;
//                           });
//                         },
//                         child: widget.isFavourite
//                             ? Icon(
//                                 Icons.bookmark,
//                                 size: 35,
//                                 color: Color(0xff192965),
//                               )
//                             : Icon(
//                                 Icons.bookmark_border,
//                                 size: 35,
//                                 color: Color(0xff192965),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   Container(
//                     height: widget.title.length <= 35
//                         ? 68
//                         : widget.title.length <= 60 ? 88 : 118,
//                     width: 360,
//                     decoration: BoxDecoration(
//                       color: Color(0xff97F7C3).withOpacity(0.4),
//                     ),
//                     padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           widget.title,
//                           style: CognifeedTypography.title,
//                           maxLines: 3,
//                         ),
//                         SizedBox(height: 10),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               animatedHeight == 0
//                                   ? animatedHeight = 209
//                                   : animatedHeight = 0;
//                             });
//                           },
//                           child: AnimatedContainer(
//                             child: animatedHeight == 0
//                                 ? Image.asset(
//                                     "assets/images/down.png",
//                                     height: 20,
//                                     color: Colors.black,
//                                   )
//                                 : Image.asset(
//                                     "assets/images/up.png",
//                                     height: 20,
//                                     color: Colors.black.withOpacity(0.7),
//                                   ),
//                             duration: Duration(microseconds: 200),
//                             curve: Curves.easeOutCirc,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   AnimatedContainer(
//                     padding: EdgeInsets.all(8),
//                     height: animatedHeight,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           widget.description,
//                           textAlign: TextAlign.justify,
//                           maxLines: 6,
//                           style: CognifeedTypography.searchBox
//                               .copyWith(color: Colors.black),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               "Read Full Article Here",
//                               style: CognifeedTypography.textStyle2.copyWith(
//                                 color: Color(0xff192965),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(
//                                 top: 4,
//                               ),
//                               child: Image.asset(
//                                 "assets/images/right.png",
//                                 height: 20,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     curve: Curves.bounceOut,
//                     duration: Duration(
//                       milliseconds: 200,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           curve: Curves.bounceOut,
//           duration: Duration(
//             milliseconds: 200,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomThumbShape extends SliderComponentShape {
//   final double thumbRadius;

//   const CustomThumbShape({
//     this.thumbRadius = 6.0,
//   });

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(thumbRadius);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     Animation<double> activationAnimation,
//     Animation<double> enableAnimation,
//     bool isDiscrete,
//     TextPainter labelPainter,
//     RenderBox parentBox,
//     SliderThemeData sliderTheme,
//     TextDirection textDirection,
//     double value,
//   }) {
//     final Canvas canvas = context.canvas;

//     final rect = Rect.fromCircle(center: center, radius: thumbRadius);

//     final fillPaint = Paint()
//       ..color = sliderTheme.activeTrackColor
//       ..style = PaintingStyle.fill
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 8.0;
//     canvas.drawLine(Offset(rect.left - 7, rect.bottom - 6),
//         Offset(rect.left + 18, rect.bottom - 6), fillPaint);
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_state.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ArticlesBloc>(context).add(GetHomePageArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
          bloc: BlocProvider.of<ArticlesBloc>(context),
          builder: (BuildContext context, ArticlesState state) {
            if (state is ArticlesLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: state.articlesModel.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleBox(
                      article: state.articlesModel.articles[index]);
                },
              );
            } else if (state is ArticlesErrorState) {
              return Container(
                child: Text(state.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class ArticleBox extends StatefulWidget {
  final Article article;

  const ArticleBox({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.37),
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.article.title.trim(),
                      style: CognifeedTypography.articleTitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.article.description,
                      style: CognifeedTypography.articleDescription,
                      maxLines: 7,
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: widget.article.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesome.globe,
                    size: 12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Website",
                    style:
                        CognifeedTypography.textStyle2.copyWith(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "10",
                        style: CognifeedTypography.textStyle2
                            .copyWith(fontSize: 14, height: 1.1),
                      ),
                      Text(
                        "views",
                        style: CognifeedTypography.textStyle2
                            .copyWith(fontSize: 14, height: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.article.isFav = !widget.article.isFav;
                      });
                    },
                    child: Icon(
                      widget.article.isFav
                          ? FontAwesome.heart
                          : FontAwesome.heart_o,
                      color: widget.article.isFav ? Colors.red : Colors.black,
                      // size: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomBottomSheet(context,
                          backgroundColor: Colors.grey[100],
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 18),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200],
                                              width: 2))),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Operating System"),
                                      Container(
                                        height: 10,
                                        width: 15,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      CustomListTile(
                                        icon: Icons.share,
                                        label: "Share",
                                        onPressed: () {},
                                      ),
                                      CustomListTile(
                                        icon: Icons.highlight_off,
                                        label: "Hide this article",
                                        onPressed: () {},
                                      ),
                                      CustomListTile(
                                        icon: FontAwesome.magic,
                                        label: "Manage Interests",
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text('Close'),
                                )
                              ],
                            ),
                          ));
                    },
                    child: Icon(
                      Icons.more_vert,
                      // size: 18,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context,
    {Widget child,
    Function callOnThen,
    Color backgroundColor = Colors.white,
    double bottomPadding = 32,
    Color barColor = const Color(0XFFeeedee)}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child],
          ),
        );
      }).then((_) {
    if (callOnThen != null) callOnThen();
  });
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomListTile({Key key, this.icon, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 14,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
