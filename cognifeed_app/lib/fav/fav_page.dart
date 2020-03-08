import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_state.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavPage extends StatefulWidget {
  static const route = "/home";

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  void initState() {
    BlocProvider.of<ArticlesBloc>(context).add(GetFavPageArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
          bloc: BlocProvider.of<ArticlesBloc>(context),
          builder: (BuildContext context, ArticlesState state) {
            if (state is ArticlesLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: state.articlesModel.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleBox(
                      article: state.articlesModel.articles[index]);
                },
              );
            } else if (state is ArticlesErrorState) {
              return Container(
                child: Text(state.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
