import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/fav_bloc.dart';
import 'package:cognifeed_app/articles/fav_event.dart';
import 'package:cognifeed_app/articles/fav_state.dart';
import 'package:cognifeed_app/search/search_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/404.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:cognifeed_app/widgets/article_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FavPage extends StatefulWidget {
  static const route = "/fav";

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int pageNo = 1;
  bool showLoading = true;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<FavArticlesBloc>(context).add(GetFavPageArticlesEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        showLoading = true;
        setState(() {});
        getNewArticles();
      }
    });
  }

  void getNewArticles() async {
    try {
      ArticlesModel newArticles = await ArticleRepository.getFavPageArticles(
          searchby: '', query: '', pageNo: ++pageNo);

      BlocProvider.of<FavArticlesBloc>(context)
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
      child: BlocBuilder<FavArticlesBloc, FavArticlesState>(
          bloc: BlocProvider.of<FavArticlesBloc>(context),
          builder: (BuildContext context, FavArticlesState state) {
            if (state is FavArticlesLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<FavArticlesBloc>(context)
                      .add(GetFavPageArticlesEvent());
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
