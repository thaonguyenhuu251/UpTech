class NewsModel {
  late int idNews;
  late String name;
  late String description;
  late int dateUpdate;
  late String urlNews;

  NewsModel(
      this.idNews,
      this.name,
      this.description,
      this.dateUpdate,
      this.urlNews,
  );

  NewsModel.fromJson(Map<dynamic, dynamic> json) {
    idNews = json['idNews'] as int;
    name = json['name'] as String;
    description = json['description'] as String;
    dateUpdate = json['dateUpdate'] as int;
    urlNews = json['urlNews'] as String;
  }
}