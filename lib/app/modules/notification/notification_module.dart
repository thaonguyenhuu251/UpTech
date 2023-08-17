import 'package:UpTech/app/page/general/general_page.dart';
import 'package:UpTech/app/page/notification/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotificationModule extends WidgetModule {
  GlobalKey<NavigatorState> _notificationNavigator = GlobalKey();

  NotificationModule({super.key});
  @override
  List<Bind> get binds => [];

  @override
  // TODO: implement view
  Widget get view => Navigator(
    key: _notificationNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => NotificationPage());
    }
    return null;
  }
}
