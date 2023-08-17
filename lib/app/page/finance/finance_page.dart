import 'package:UpTech/app/page/loading/loading_page.dart';
import 'package:UpTech/common/app_dimens.dart';
import 'package:UpTech/tool/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[],
        )
      ),
    );
  }
}