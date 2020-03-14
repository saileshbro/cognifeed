import 'package:cognifeed_app/articles/hide_bloc.dart';
import 'package:cognifeed_app/articles/hide_event.dart';
import 'package:cognifeed_app/articles/hide_state.dart';
import 'package:cognifeed_app/search/search_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/404.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:cognifeed_app/widgets/article_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HiddenPage extends StatefulWidget {
  static const route = "/hidden";

  @override
  HiddenPageState createState() => HiddenPageState();
}

class HiddenPageState extends State<HiddenPage> {
  @override
  void initState() {
    BlocProvider.of<HideArticlesBloc>(context)
        .add(GetHiddenPageArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      actions: [
        IconButton(
          icon: Icon(Feather.search),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SearchPage(
                      searchType: SearchType.HIDDEN,
                    )));
          },
        ),
        IconButton(
          icon: Icon(BlocProvider.of<ThemeBloc>(context).isDarkTheme
              ? FontAwesome.sun_o
              : FontAwesome.moon_o),
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(
                BlocProvider.of<ThemeBloc>(context).isDarkTheme
                    ? LightThemeEvent()
                    : DarkThemeEvent());
          },
        ),
      ],
      child: BlocBuilder<HideArticlesBloc, HideArticlesState>(
          bloc: BlocProvider.of<HideArticlesBloc>(context),
          builder: (BuildContext context, HideArticlesState state) {
            if (state is HideArticlesLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HideArticlesBloc>(context)
                      .add(GetHiddenPageArticlesEvent());
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: state.articlesModel.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticleBox(
                        article: state.articlesModel.articles[index]);
                  },
                ),
              );
            } else if (state is HideArticlesErrorState) {
              return NotFound404();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
