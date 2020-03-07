class ArticlesModel {
  List<Article> articles;

  ArticlesModel({this.articles});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = new List<Article>();
      json['articles'].forEach((v) {
        articles.add(new Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  int articleId;
  String title;
  String description;
  String imageUrl;
  String linkUrl;
  int viewCount;

  Article({
    this.articleId,
    this.title,
    this.description,
    this.imageUrl,
    this.linkUrl,
    this.viewCount,
  });

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
    linkUrl = json['link_url'];
    viewCount = json['view_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['link_url'] = this.linkUrl;
    data['view_count'] = this.viewCount;
    return data;
  }
}
