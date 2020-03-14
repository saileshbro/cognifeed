import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:cognifeed_app/articles/articles_bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/fav_bloc.dart';
import 'package:cognifeed_app/articles/fav_event.dart';
import 'package:cognifeed_app/articles/hide_bloc.dart';
import 'package:cognifeed_app/articles/hide_event.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/fav/fav_page.dart';
import 'package:cognifeed_app/helpers/getShareText.dart';
import 'package:cognifeed_app/hidden/hidden_page.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/tags/tags_repository.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/webview/full_article_page.dart';
import 'package:cognifeed_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

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
        color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
            ? Color(0xff1b1b1b)
            : Colors.white,
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FullArticlePage(
                    article: widget.article,
                  ),
                ),
              );
            },
            child: Row(
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
                        style: CognifeedTypography.articleDescription.copyWith(
                          color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                              ? Colors.white.withOpacity(0.87)
                              : Colors.black87,
                        ),
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
                    this.widget.article.website,
                    style: CognifeedTypography.medium.copyWith(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        widget.article.viewCount.toString(),
                        style: CognifeedTypography.medium.copyWith(
                          fontSize: 14,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        "views",
                        style: CognifeedTypography.medium
                            .copyWith(fontSize: 14, height: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (!widget.article.isFav) {
                        print("add clicked");
                        ArticleRepository.addToFav(
                                articleId: widget.article.articleId.toString())
                            .then((response) {
                          if (response.statusCode == 200) {
                            setState(() {
                              widget.article.isFav = !widget.article.isFav;
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(widget.article.title +
                                  " added to favourite!"),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(response.data['error']),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      } else {
                        ArticleRepository.removeFromFav(
                                articleId: widget.article.articleId.toString())
                            .then((response) {
                          if (response.statusCode == 200) {
                            setState(() {
                              widget.article.isFav = !widget.article.isFav;
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(widget.article.title +
                                  " removed from favourite!"),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(response.data['error']),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        widget.article.isFav
                            ? FontAwesome.heart
                            : FontAwesome.heart_o,
                        color: widget.article.isFav ? Colors.red : null,
                        // size: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomBottomSheet(context,
                          // backgroundColor: Colors.grey[100],
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]
                                                  .withOpacity(.5),
                                              width: 1))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                          child: Text(widget.article.title)),
                                      GestureDetector(
                                        onTap: () async {
                                          if (widget.article.isSelected) {
                                            TagRepository.unfollow(
                                                    tagId: widget.article.tagId
                                                        .toString())
                                                .then((response) {
                                              setState(() {
                                                widget.article.isSelected =
                                                    !widget.article.isSelected;
                                              });
                                              Navigator.of(context).pop();
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    response.data['message']),
                                                backgroundColor: Colors.red,
                                              ));
                                            });
                                          } else {
                                            TagRepository.follow(
                                                    tagId: widget.article.tagId
                                                        .toString())
                                                .then((response) {
                                              setState(() {
                                                widget.article.isSelected =
                                                    !widget.article.isSelected;
                                              });
                                              Navigator.of(context).pop();
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    response.data['message']),
                                                backgroundColor: Colors.green,
                                              ));
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: widget.article.isSelected
                                                  ? Colors.green
                                                  : CognifeedColors.coralPink,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Icon(
                                                !widget.article.isSelected
                                                    ? Icons.add
                                                    : Icons.check,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                widget.article.tagName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      CustomListTile(
                                        icon: Icons.share,
                                        label: "Share",
                                        onPressed: () {
                                          Share.share(getShareText(
                                              widget.article.title,
                                              widget.article.description,
                                              widget.article.linkUrl));
                                        },
                                      ),
                                      CustomListTile(
                                        icon: Icons.link,
                                        label: "Copy link",
                                        onPressed: () {
                                          ClipboardManager.copyToClipBoard(
                                                  widget.article.linkUrl)
                                              .then((result) {
                                            Navigator.pop(context);
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('Copied to Clipboard'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          });
                                        },
                                      ),
                                      CustomListTile(
                                        icon: Icons.highlight_off,
                                        label: widget.article.isHidden
                                            ? "Remove from hidden"
                                            : "Hide this article",
                                        onPressed: () async {
                                          if (!widget.article.isHidden) {
                                            ArticleRepository.hideArticle(
                                                    articleId: widget
                                                        .article.articleId
                                                        .toString())
                                                .then((response) {
                                              if (response.statusCode == 200) {
                                                Navigator.pop(context);
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      widget.article.title +
                                                          " hidden!"),
                                                  backgroundColor: Colors.green,
                                                ));
                                                if (ModalRoute.of(context)
                                                        .settings
                                                        .name ==
                                                    HomePage.route) {
                                                  BlocProvider.of<ArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetHomePageArticlesEvent());
                                                } else if (ModalRoute.of(
                                                            context)
                                                        .settings
                                                        .name ==
                                                    FavPage.route) {
                                                  BlocProvider.of<
                                                              FavArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetFavPageArticlesEvent());
                                                } else if (ModalRoute.of(
                                                            context)
                                                        .settings
                                                        .name ==
                                                    HiddenPage.route) {
                                                  BlocProvider.of<
                                                              HideArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetHiddenPageArticlesEvent());
                                                }
                                              } else {
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      response.data['error']),
                                                  backgroundColor: Colors.red,
                                                ));
                                              }
                                            });
                                          } else {
                                            ArticleRepository.showArticle(
                                                    articleId: widget
                                                        .article.articleId
                                                        .toString())
                                                .then((response) {
                                              if (response.statusCode == 200) {
                                                Navigator.pop(context);
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(widget
                                                          .article.title +
                                                      " removed from hidden!"),
                                                  backgroundColor: Colors.green,
                                                ));
                                                if (ModalRoute.of(context)
                                                        .settings
                                                        .name ==
                                                    HomePage.route) {
                                                  BlocProvider.of<ArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetHomePageArticlesEvent());
                                                } else if (ModalRoute.of(
                                                            context)
                                                        .settings
                                                        .name ==
                                                    FavPage.route) {
                                                  BlocProvider.of<
                                                              FavArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetFavPageArticlesEvent());
                                                } else if (ModalRoute.of(
                                                            context)
                                                        .settings
                                                        .name ==
                                                    HiddenPage.route) {
                                                  BlocProvider.of<
                                                              HideArticlesBloc>(
                                                          context)
                                                      .add(
                                                          GetHiddenPageArticlesEvent());
                                                }
                                              } else {
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      response.data['error']),
                                                  backgroundColor: Colors.red,
                                                ));
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      CustomListTile(
                                        icon: FontAwesome.magic,
                                        label: "Manage Interests",
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: Navigator.of(context).pop,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.white.withOpacity(0.8),
                                          style: BorderStyle.solid,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text('Close'),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.more_vert,
                        // size: 18,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context,
      {Widget child,
      Function callOnThen,
      double bottomPadding = 32,
      Color barColor = const Color(0XFFeeedee)}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
                  ? Color(0xff212121)
                  : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[child],
            ),
          );
        }).then((_) {
      if (callOnThen != null) callOnThen();
    });
  }
}
