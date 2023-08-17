import 'package:UpTech/app/app_controller.dart';
import 'package:UpTech/models/courses/course_model.dart';
import 'package:UpTech/models/courses/courses_dao.dart';
import 'package:UpTech/models/new/news_dao.dart';
import 'package:UpTech/models/new/news_model.dart';
import 'package:UpTech/services/api.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GeneralBloc extends Disposable {
  final Api api;
  final AppController app = Modular.get<AppController>();
  GeneralBloc(this.api);

  final newsDao = NewsDao();
  final coursesDao = CourseDao();
  final List<NewsModel> listNews = [];
  final List<CourseModel> listCourse = [];

  getNews() async {
    listNews.clear();
    listCourse.clear();
    app.setLoad(true);
    try {
      final snapshotNews = await newsDao.getMessageQuery().get();
      final jsonNews = snapshotNews.value as Map<dynamic, dynamic>;

      jsonNews.forEach((key, value) {
        final news = NewsModel.fromJson(value);
        listNews.add(news);
      });

      final snapshotCourse = await coursesDao.getMessageQuery().get();
      final jsonCourse = snapshotCourse.value as Map<dynamic, dynamic>;

      jsonCourse.forEach((key, value) {
        final coursesDao = CourseModel.fromJson(value);
        listCourse.add(coursesDao);
      });
    } catch (e) {
      print(e);
      AlertController.show("Error", e.toString(), TypeAlert.error);
    }
    print(listNews.length);
    print(listCourse.length);
    app.setLoad(false);
  }

  @override
  void dispose() {}
}
