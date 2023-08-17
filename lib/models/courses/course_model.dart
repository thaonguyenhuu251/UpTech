class CourseModel {
  late int idCourse;
  late String nameCourse;
  late String descriptionCourse;
  late int dateUpdate;
  late int watchLong;
  late int numberLesson;
  late String urlImage;

  CourseModel(
      this.idCourse,
      this.nameCourse,
      this.descriptionCourse,
      this.dateUpdate,
      this.watchLong,
      this.numberLesson,
      this.urlImage,
  );

  CourseModel.fromJson(Map<dynamic, dynamic> json) {
    idCourse = json['idCourse'] as int;
    nameCourse = json['nameCourse'] as String;
    descriptionCourse = json['descriptionCourse'] as String;
    dateUpdate = json['dateUpdate'] as int;
    watchLong = json['watchLong'] as int;
    numberLesson = json['numberLesson'] as int;
    urlImage = json['urlImage'] as String;
  }
}