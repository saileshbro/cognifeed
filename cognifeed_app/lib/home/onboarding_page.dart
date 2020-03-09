import 'package:cognifeed_app/hidden/hidden_page.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/tags/tags_bloc.dart';
import 'package:cognifeed_app/tags/tags_event.dart';
import 'package:cognifeed_app/tags/tags_model.dart';
import 'package:cognifeed_app/tags/tags_repository.dart';
import 'package:cognifeed_app/tags/tags_state.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    BlocProvider.of<TagBloc>(context).add(GetTagsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      // backgroundColor: Colors.black.withOpacity(0.2),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: Color(0xffff5a5f),
          onPressed: () {
            if (selectedTags.tags.length != 0) {
              TagRepository.sendSelectedTags(tags: selectedTags)
                  .then((response) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(
                      content: Text(response.data['message']),
                      backgroundColor: Colors.green,
                    ))
                    .closed
                    .then((onValue) {
                  Navigator.of(context).pop();
                  Cognifeed.drawerPages = DrawerPages.Home;
                  Navigator.of(context).pushReplacementNamed("/");
                });
              });
            }
          },
          child: Icon(
            Feather.arrow_right,
            size: 35,
          ),
        );
      }),
      child: BlocBuilder<TagBloc, TagState>(
          bloc: BlocProvider.of<TagBloc>(context),
          builder: (context, state) {
            if (state is TagFetchedState) {
              selectedTags = state.tags.getSelectedTags();
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  child: Wrap(
                    spacing: 6,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 15,
                    children: state.tags.tags.map((tag) {
                      return CustomChip(tag: tag);
                    }).toList(),
                  ),
                ),
              );
            } else if (state is TagErrorState) {
              return Text(state.error);
            } else if (state is TagLoadingState)
              return Center(child: CircularProgressIndicator());
            return Container();
          }),
      title: "Make Your Choices!",
      showDrawer: false,
    );
  }
}

class CustomChip extends StatefulWidget {
  final Tag tag;

  const CustomChip({Key key, @required this.tag}) : super(key: key);

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.tag.isSelected = !widget.tag.isSelected;
        if (widget.tag.isSelected) {
          selectedTags.tags.add(widget.tag);
        } else {
          if (selectedTags.tags.contains(widget.tag)) {
            selectedTags.tags.remove(widget.tag);
          }
        }
        setState(() {});
        print(selectedTags.toJson());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: (widget.tag.isSelected) ? Color(0xffff5a5f) : Colors.white,
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
          this.widget.tag.tagName,
          style: CognifeedTypography.articleTitle.copyWith(
              color: (widget.tag.isSelected) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

TagArray selectedTags = TagArray(
  tags: [],
);
