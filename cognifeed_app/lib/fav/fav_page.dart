import 'package:cognifeed_app/articles/fav_bloc.dart';
import 'package:cognifeed_app/articles/fav_event.dart';
import 'package:cognifeed_app/articles/fav_state.dart';
import 'package:cognifeed_app/constants/cognifeed_constants.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:cognifeed_app/search/search_page.dart';
import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:cognifeed_app/theme/theme_event.dart';
import 'package:cognifeed_app/widgets/application_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FavPage extends StatefulWidget {
  static const route = "/fav";

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  void initState() {
    BlocProvider.of<FavArticlesBloc>(context).add(GetFavPageArticlesEvent());
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
                      searchType: SearchType.FAV,
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

class NotFound404 extends StatelessWidget {
  const NotFound404({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/404.png',
          ),
          Text(
            "Not Found !!",
            style: CognifeedTypography.textStyle1.copyWith(
              color: CognifeedColors.coralPink,
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
