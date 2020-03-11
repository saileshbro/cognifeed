import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/hidden/hidden_page.dart';
import 'package:cognifeed_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchPage extends StatefulWidget {
  final SearchType searchType;

  const SearchPage({Key key, @required this.searchType}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller;
  bool shouldCall = false;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String selection = "title";
  Future getSearchArticles({String searchBy, String query}) {
    switch (widget.searchType) {
      case SearchType.FAV:
        return ArticleRepository.getFavPageArticles(
            query: query, searchby: searchBy);
        break;
      case SearchType.HIDDEN:
        return ArticleRepository.getHiddenPageArticles(
            query: query, searchby: searchBy);
        break;
      case SearchType.HOME:
        return ArticleRepository.getHomePageArticles(
            query: query, searchby: searchBy);
        break;
      default:
        return ArticleRepository.getHomePageArticles(
            query: query, searchby: searchBy);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _controller,
          autofocus: true,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              shouldCall = true;
            });
          },
          onTap: () {
            setState(() {
              shouldCall = false;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Feather.search,
              color: Colors.black,
              size: 18,
            ),
            suffixIcon: DropdownButton<String>(
              value: selection,
              onChanged: (String s) {
                setState(() {
                  selection = s;
                });
              },
              items: ["title", 'tag', "website"].map((item) {
                return DropdownMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
            ),
            hintText: 'Search...',
          ),
        ),
      ),
      body: shouldCall
          ? FutureBuilder(
              future: getSearchArticles(
                  query: _controller.text, searchBy: selection),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: snapshot.data.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ArticleBox(article: snapshot.data.articles[index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NotFound404();
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          : Container(),
    );
  }
}

enum SearchType { HOME, FAV, HIDDEN }
