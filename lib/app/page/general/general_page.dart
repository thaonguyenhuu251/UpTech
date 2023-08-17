import 'dart:async';

import 'package:UpTech/app/page/general/general_bloc.dart';
import 'package:UpTech/app/widgets/sort_dialog_widget.dart';
import 'package:UpTech/models/courses/course_model.dart';
import 'package:UpTech/models/new/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  _GeneralPage createState() => _GeneralPage();
}

class _GeneralPage extends State<GeneralPage> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;
  GeneralBloc generalBloc = Modular.get<GeneralBloc>();
  int currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    generalBloc.getNews();
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final newList =  _getNewList();
    final courseList = _getNewList();
    return SafeArea(
        bottom: true,
        child: !isLoading ? Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TopBar(),
              Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              HomeSearch(),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      labelPadding: EdgeInsets.all(20),
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      unselectedLabelStyle:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.only(right: 20),
                      indicatorColor: Colors.blue,
                      onTap: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      tabs: [
                        Row(children: [
                          Icon(Icons.new_label),
                          SizedBox(width: 5),
                          Text("New")
                        ]),
                        Row(children: [
                          Icon(Icons.golf_course),
                          SizedBox(width: 5),
                          Text("Khoá học")
                        ]),
                        Row(children: [
                          Icon(Icons.travel_explore_sharp),
                          SizedBox(width: 5),
                          Text("Đề xuất chuyên gia")
                        ]),
                        Row(children: [
                          Icon(Icons.event),
                          SizedBox(width: 5),
                          Text("Sự kiện")
                        ]),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          IconButton(
                              enableFeedback: false,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => SortDialogWidget(
                                        sortFrom: currentIndex));
                              },
                              icon: SvgPicture.asset(
                                'assets/icon/ic_filter.svg',
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              )),
                          IconButton(
                              enableFeedback: false,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading: new Icon(Icons.photo),
                                            title: new Text('Photo'),
                                            onTap: () {
                                              Modular.to.pushNamed('/webview');
                                            },
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.music_note),
                                            title: new Text('Music'),
                                            onTap: () {
                                              Modular.to.pushNamed('/home_search');
                                            },
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.videocam),
                                            title: new Text('Video'),
                                            onTap: () {
                                              Modular.to.pushNamed('/signup');
                                            },
                                          ),
                                          ListTile(
                                            leading: new Icon(Icons.share),
                                            title: new Text('Share'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: SvgPicture.asset(
                                'assets/icon/ic_sort.svg',
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              currentIndex == 0
                  ? newList
                  : currentIndex == 1
                      ? courseList
                      : currentIndex == 2
                          ? newList
                          : newList
            ],
          ),
        ) : Center(child: Text('Đang tải dữ liệu...'),));
  }

  Widget _getNewList() {
    return generalBloc.listNews.length != 0
        ? Expanded(
            child: ListView.builder(
              itemCount: generalBloc.listNews.length,
              itemBuilder: (context, position) {
                return _itemNewsWidget(generalBloc.listNews[position]);
              },
            ),
          )
        : Expanded(
            child: Center(
            child: Text(
              'Không có dữ liệu',
              style: TextStyle(color: Colors.black),
            ),
          ));
  }

  Widget _getCourseList() {
    return generalBloc.listCourse.length != 0
        ? Expanded(
            child: ListView.builder(
              itemCount: generalBloc.listCourse.length,
              itemBuilder: (context, position) {
                return _itemCourseWidget(generalBloc.listCourse[position]);
              },
            ),
          )
        : Expanded(
            child: Center(
            child: Text(
              'Không có dữ liệu',
              style: TextStyle(color: Colors.black),
            ),
          ));
  }

  Widget _itemNewsWidget(NewsModel news) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFFF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(news.urlNews),
                )),
            Padding(padding: EdgeInsets.all(5)),
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.nat),
                        Text(
                          news.name,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                          news.description,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.music_note),
                        Text(
                          news.dateUpdate.toString(),
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }

  Widget _itemCourseWidget(CourseModel course) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFFF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(course.urlImage),
                )),
            Padding(padding: EdgeInsets.all(5)),
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.nat),
                        Text(
                          course.nameCourse,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                          course.descriptionCourse,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.music_note),
                        Text(
                          course.dateUpdate.toString(),
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/icon_app.png',
                alignment: Alignment.center,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "UP TECH",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Color(0xff0D6EFD),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              child: IconButton(
                  splashColor: Colors.transparent,
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/messenger');
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_bottom_chat.svg',
                    alignment: Alignment.center,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xffFD1600),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                ))
          ],
        )
      ],
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/home_search');
      },
      child: Container(
        height: 52,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFFF),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Cyber security",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SvgPicture.asset(
              'assets/images/ic_search_new.svg',
              alignment: Alignment.center,
              width: 38,
              height: 38,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
