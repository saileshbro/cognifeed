import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
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
  _HiddenPageState createState() => _HiddenPageState();
}

class _HiddenPageState extends State<HiddenPage> {
  int pageNo = 1;
  bool showLoading = true;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<HideArticlesBloc>(context)
        .add(GetHiddenPageArticlesEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached");
        showLoading = true;
        setState(() {});
        getNewArticles();
        print(BlocProvider.of<HideArticlesBloc>(context)
            .response
            .articles
            .length);
      }
    });
  }

  void getNewArticles() async {
    try {
      ArticlesModel newArticles = await ArticleRepository.getHiddenPageArticles(
          searchby: '', query: '', pageNo: ++pageNo);

      BlocProvider.of<HideArticlesBloc>(context)
          .response
          .articles
          .addAll(newArticles.articles);
      setState(() {
        showLoading = false;
      });
    } catch (e) {
      setState(() {
        showLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                      searchType: SearchType.FAV,
                    )));
          },
        ),
        IconButton(
          icon: Icon(BlocProvider.of<ThemeBloc>(context).isDarkTheme
              ? WeatherIcons.wi_day_sunny
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
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: state.articlesModel.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.articlesModel.articles.length - 1) {
                      return Column(
                        children: <Widget>[
                          ArticleBox(
                              article: state.articlesModel.articles[index]),
                          if (showLoading)
                            Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }

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
