import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ApplicationWrapper extends StatefulWidget {
  @override
  _ApplicationWrapperState createState() => _ApplicationWrapperState();
}

class _ApplicationWrapperState extends State<ApplicationWrapper> {
  ColorMaker selectedColorMarker = ColorMaker.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          getCurrentWidget(selectedColorMarker),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff97F7C3),
          ),
          CustomBottomNavBar(
            selectedColorMaker: selectedColorMarker,
            changeIndex: (ColorMaker marker) {
              print(marker);
              setState(() {
                selectedColorMarker = marker;
              });
            },
          )
        ],
      ),
    );
  }
}

Widget getCurrentWidget(ColorMaker colorMaker) {
  switch (colorMaker) {
    case ColorMaker.home:
      return HomePage();
      break;
    case ColorMaker.setting:
      return Center(child: Text("setting"));
      break;
    case ColorMaker.bookmark:
      return Center(child: Text("bookmark"));
      break;
    case ColorMaker.people:
      return Center(child: Text("people"));
      break;
    default:
      return Center(child: Text("home"));
      break;
  }
}
