import 'package:cognifeed_app/articles/all_articles_bloc.dart';
import 'package:cognifeed_app/articles/all_articles_event.dart';
import 'package:cognifeed_app/articles/all_articles_state.dart';
import 'package:cognifeed_app/search/search_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/404.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:cognifeed_app/widgets/article_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AllArticlesPage extends StatefulWidget {
  static const route = "/all";

  @override
  _AllArticlesPageState createState() => _AllArticlesPageState();
}

class _AllArticlesPageState extends State<AllArticlesPage> {
  @override
  void initState() {
    BlocProvider.of<AllArticlesBloc>(context)
        .add(GetAllArticlesPageArticlesEvent());
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
                      searchType: SearchType.ALL,
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
      child: BlocBuilder<AllArticlesBloc, AllArticlesState>(
          bloc: BlocProvider.of<AllArticlesBloc>(context),
          builder: (BuildContext context, AllArticlesState state) {
            if (state is AllArticlesLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<AllArticlesBloc>(context)
                      .add(GetAllArticlesPageArticlesEvent());
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
