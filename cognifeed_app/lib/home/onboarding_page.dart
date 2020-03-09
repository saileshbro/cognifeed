import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/Tags.dart';
import '../constants/cognifeed_constants.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffff5a5f),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        },
        child: Icon(
          Feather.arrow_right,
          size: 25,
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xfff2f5f9),
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: Wrap(
            spacing: 15,
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 15,
            children: alltags.map((tag) {
              return CustomChip(tag: tag);
            }).toList(),
          ),
        ),
      ),
      title: "Make Your Choices!",
      showDrawer: false,
    );
  }
}

class CustomChip extends StatefulWidget {
  final String tag;

  const CustomChip({Key key, @required this.tag}) : super(key: key);

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  /// chips defination
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        if (isSelected) {
          selectedTags.add(widget.tag);
        } else {
          if (selectedTags.contains(widget.tag)) {
            selectedTags.remove(widget.tag);
          }
        }
        setState(() {});
        print(selectedTags);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: (isSelected) ? Color(0xffff5a5f) : Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: Text(
          this.widget.tag,
          style: CognifeedTypography.articleTitle
              .copyWith(color: (isSelected) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

var selectedTags = [];
