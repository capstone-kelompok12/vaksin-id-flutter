class NewsModel {
  String? author;
  String? title;
  String? urlToImage;
  String? content;
  String? description;
  String? publishedAt;
  String? url;

  NewsModel({
    this.author,
    this.title,
    this.urlToImage,
    this.content,
    this.description,
    this.publishedAt,
    this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        author: json['author'],
        title: json['title'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        url: json['url'],
      );
  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'urlToImage': urlToImage,
        'content': content,
        'description': description,
        'publishedAt': publishedAt,
        'url': url,
      };
}
