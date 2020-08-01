class ArticlesModel{
  
  dynamic articles;

  ArticlesModel({
    this.articles
  });

  factory ArticlesModel.fromJson(dynamic json){
    List<ArticleModel> arr=json.map((i)=>ArticleModel.fromJson(i)).toList();
    return ArticlesModel(
      articles: arr
    );
  }
}

class ArticleModel{
  String articleUrl;
  String title;
  String imageUrl;
  String token;

  ArticleModel({
    this.articleUrl,
    this.title,
    this.imageUrl,
    this.token
  });

  factory ArticleModel.fromJson(dynamic json){
    return ArticleModel(
      articleUrl: json["url"],
      title: json["title"],
      imageUrl: json["image"],
      token: json["token"],
    );
  }
}