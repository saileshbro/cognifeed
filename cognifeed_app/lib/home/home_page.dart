import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/articles_state.dart';
import 'package:cognifeed_app/search/search_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/404.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:cognifeed_app/widgets/article_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  bool showLoading = true;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<ArticlesBloc>(context).add(GetHomePageArticlesEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached");
        getNewArticles();
        print(BlocProvider.of<ArticlesBloc>(context).response.articles.length);
      }
    });
  }

  void getNewArticles() async {
    try {
      ArticlesModel newArticles = await ArticleRepository.getHomePageArticles(
          searchby: '', query: '', pageNo: ++pageNo);

      BlocProvider.of<ArticlesBloc>(context)
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
                      searchType: SearchType.HOME,
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
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
          bloc: BlocProvider.of<ArticlesBloc>(context),
          builder: (BuildContext context, ArticlesState state) {
            if (state is ArticlesLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<ArticlesBloc>(context)
                      .add(GetHomePageArticlesEvent());
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
            } else if (state is ArticlesErrorState) {
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
