import 'package:cognifeed_app/constants/Tags.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 20,
              direction: Axis.horizontal,
              children: alltags.map((title) => TagWidget(tag: title)).toList(),
            ),
          ),
        ],
      ),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIconMaker == IconMaker.add
              ? selectedIconMaker = IconMaker.saved
              : selectedIconMaker = IconMaker.add;
        });
      },
      child: Container(
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
                  ? CognifeedTypography.tags.copyWith(
                      color: Color(0xff192965),
                      fontWeight: FontWeight.w600,
                    )
                  : CognifeedTypography.tags.copyWith(
                      color: Color(0xffe9fdfc),
                      fontSize: 20,
                    ),
              textAlign: TextAlign.center,
            ),
            selectedIconMaker == IconMaker.add ? AddIcon() : CheckedIcon(),
          ],
        ),
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
