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
  int tagId;
  String title;
  String description;
  String imageUrl;
  String linkUrl;
  bool isFav;
  String tagName;
  int viewCount;
  bool isHidden;
  bool isSelected;

  Article({
    this.articleId,
    this.tagId,
    this.title,
    this.description,
    this.imageUrl,
    this.linkUrl,
    this.isFav,
    this.tagName,
    this.viewCount,
    this.isHidden,
    this.isSelected,
  });

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    tagId = json['tag_id'] ?? 0;
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
    linkUrl = json['link_url'];
    viewCount = json['view_count'];
    isHidden = json['is_hidden'] ?? false;
    isSelected = json['is_selected'] ?? false;
    isFav = json['is_fav'] ?? false;
    tagName = json['tag_name'] ?? "TAG";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['tag_id'] = this.tagId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['link_url'] = this.linkUrl;
    data['view_count'] = this.viewCount;
    data['is_hidden'] = this.isHidden;
    data['is_selected'] = this.isSelected;
    data['is_fav'] = this.isFav;
    data['tag_name'] = this.tagName;
    return data;
  }
}
