import 'package:UpTech/models/new/news_dao.dart';
import 'package:UpTech/models/new/news_model.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final newsDao = NewsDao();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: TextField(
          onChanged: (text) {
            setState(() {

            });
          },
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Phone number , email or username',
          ),
        ),
      ),
    );
  }
}
