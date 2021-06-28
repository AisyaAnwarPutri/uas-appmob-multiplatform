class News {
  final String author;
  final String title;
  final String imageURL;
  final String subtitle;

  News({this.author, this.title, this.imageURL, this.subtitle});

  factory News.fromJSON(Map<String, dynamic> json) {
    return News(
      author: json["author"],
      title: json['title'],
      imageURL: json['image'],
      subtitle: json['subtitle'],
    );
  }
}
