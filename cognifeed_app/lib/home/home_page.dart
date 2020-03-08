
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_state.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants/cognifeed_constants.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ArticlesBloc>(context).add(GetHomePageArticlesEvent());
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

class ArticleBox extends StatefulWidget {
  final Article article;

  const ArticleBox({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.37),
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.article.title.trim(),
                      style: CognifeedTypography.articleTitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.article.description,
                      style: CognifeedTypography.articleDescription,
                      maxLines: 7,
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: widget.article.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesome.globe,
                    size: 12,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Website",
                    style:
                        CognifeedTypography.textStyle2.copyWith(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesome.heart_o,

                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.more_vert,

                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
