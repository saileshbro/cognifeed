import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/fav/fav_bloc.dart';
import 'package:cognifeed_app/fav/fav_event.dart';
import 'package:cognifeed_app/fav/fav_state.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticlePage extends StatefulWidget {
  final Article article;

  FullArticlePage({@required this.article});

  @override
  createState() => _FullArticlePageState();
}

class _FullArticlePageState extends State<FullArticlePage> {
  final _key = UniqueKey();
  num _stackToView = 1;

  @override
  void initState() {
    ArticleRepository.incrementArticleView(
        articleId: widget.article.articleId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (widget.article.isFav) {
              } else {
                BlocProvider.of<FavBloc>(context)
                    .add(AddToFavEvent(widget.article));
              }
            },
            icon: widget.article.isFav
                ? Icon(
                    FontAwesome.heart,
                    color: Colors.red,
                  )
                : Icon(
                    FontAwesome.heart_o,
                  ),
          ),
        ],
        showDrawer: false,
        child: BlocListener<FavBloc, FavState>(
          bloc: BlocProvider.of<FavBloc>(context),
          listener: (BuildContext context, FavState state) {
            if (state is FavSuccessState) {
              setState(() {
                widget.article.isFav = !widget.article.isFav;
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "${widget.article.title} added to favourite!",
                ),
                backgroundColor: Colors.green,
              ));
            }
            if (state is FavErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error,
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: IndexedStack(
            index: _stackToView,
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                      child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.article.linkUrl,
                    onPageFinished: (value) {
                      setState(() {
                        _stackToView = 0;
                      });
                    },
                  )),
                ],
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ));
  }
}
