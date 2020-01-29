import 'package:flutter/material.dart';

enum ColorMaker { home, setting, bookmark, people }

class CustomBottomNavBar extends StatefulWidget {
  final ColorMaker selectedColorMaker;
  final Function(ColorMaker colorMarker) changeIndex;

  const CustomBottomNavBar(
      {Key key, @required this.selectedColorMaker, @required this.changeIndex})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final navbar = MediaQuery.of(context).size.width - 140;
    return Positioned(
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
            GestureDetector(
              onTap: widget.selectedColorMaker == ColorMaker.home
                  ? null
                  : () {
                      widget.changeIndex(ColorMaker.home);
                    },
              child: Container(
                width: 0.25 * navbar,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: widget.selectedColorMaker == ColorMaker.setting
                      ? BorderRadius.all(Radius.circular(20))
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                  color: widget.selectedColorMaker == ColorMaker.home
                      ? Color(0xff00c9c3)
                      : Color(0xff004844),
                ),
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: widget.selectedColorMaker == ColorMaker.home
                      ? Color(0xff192965)
                      : Color(0xff00c9c3),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.selectedColorMaker == ColorMaker.setting
                  ? null
                  : () {
                      widget.changeIndex(ColorMaker.setting);
                    },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: widget.selectedColorMaker == ColorMaker.home
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )
                      : widget.selectedColorMaker == ColorMaker.bookmark
                          ? BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                          : BorderRadius.zero,
                  color: widget.selectedColorMaker == ColorMaker.setting
                      ? Color(0xff00c9c3)
                      : Color(0xff004844),
                ),
                width: 0.25 * navbar,
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: widget.selectedColorMaker == ColorMaker.setting
                      ? Color(0xff192965)
                      : Color(0xff00c9c3),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.selectedColorMaker == ColorMaker.bookmark
                  ? null
                  : () {
                      widget.changeIndex(ColorMaker.bookmark);
                    },
              child: Container(
                width: 0.25 * navbar,
                decoration: BoxDecoration(
                  borderRadius: widget.selectedColorMaker == ColorMaker.setting
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )
                      : widget.selectedColorMaker == ColorMaker.people
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          : BorderRadius.zero,
                  color: widget.selectedColorMaker == ColorMaker.bookmark
                      ? Color(0xff00c9c3)
                      : Color(0xff004844),
                ),
                height: 55,
                child: Icon(
                  Icons.bookmark,
                  size: 30,
                  color: widget.selectedColorMaker == ColorMaker.bookmark
                      ? Color(0xff192965)
                      : Color(0xff00c9c3),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.selectedColorMaker == ColorMaker.people
                  ? null
                  : () {
                      widget.changeIndex(ColorMaker.people);
                    },
              child: Container(
                height: 55,
                width: 0.25 * navbar,
                decoration: BoxDecoration(
                  borderRadius: widget.selectedColorMaker == ColorMaker.bookmark
                      ? BorderRadius.all(
                          Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                  color: widget.selectedColorMaker == ColorMaker.people
                      ? Color(0xff00c9c3)
                      : Color(0xff004844),
                ),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: widget.selectedColorMaker == ColorMaker.people
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
    );
  }
}
