import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppDimens {
  AppDimens._();

  static const double basePadding = 8.0;
  static const double paddingHorizontalHeaderLesson = 36.0;
  static const double tabletScreenHeight = 500;

  static double fontSizeTitle(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight) ? 50 : 28;

  static double iconCloseButtonSize(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight) ? 53 : 45;

  static double buttonSizeWidthRateDialog(BoxConstraints constraints) =>
      constraints.maxWidth * .35;

  static double buttonSizeHeightRateDialog(BoxConstraints constraints) =>
      constraints.maxHeight * .5;

  static double borderButtonRateDialog(BoxConstraints constraints) =>
      constraints.maxHeight * .5;



  static double contentRateDialogPaddingHorizontal(
          BoxConstraints constraints) =>
      constraints.maxHeight * .15;

  static double buttonRateDialogTextSize(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight) ? 28 : 15;

  static double customRateDialogSizeWidth(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight)
          ? MediaQuery.of(context).size.height * .65
          : MediaQuery.of(context).size.height * .75;

  static double customRateDialogSizeHeight(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight)
          ? MediaQuery.of(context).size.height * .75
          : MediaQuery.of(context).size.height * .75;

  static double starFillSmallIconSize(BoxConstraints constraints) =>
      constraints.maxHeight / 2;

  static double starFillLargeIconSize(BoxConstraints constraints) =>
      constraints.maxHeight / 1.5;

  static double star2IconRateDialogSize(BuildContext context) =>
      (MediaQuery.of(context).size.height > tabletScreenHeight) ? 36 : 24;


  //profile
  static double widthChangeAvtar(BuildContext context) => MediaQuery.of(context).size.width * 0.3;
}
