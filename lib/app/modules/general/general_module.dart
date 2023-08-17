import 'package:UpTech/app/page/general/general_bloc.dart';
import 'package:UpTech/app/page/general/general_page.dart';
import 'package:UpTech/app/page/messenger/message_page.dart';
import 'package:UpTech/app/page/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GeneralModule extends WidgetModule {
  GlobalKey<NavigatorState> _generalNavigator = GlobalKey();

  GeneralModule({super.key});
  @override
  List<Bind> get binds => [
    Bind((i) => GeneralBloc(i()), isLazy: true, isSingleton: false),
  ];

  @override
  // TODO: implement view
  Widget get view => Navigator(
    key: _generalNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => GeneralPage());
      case '/messenger':
        return MaterialPageRoute(builder: (_) => MessageScreen());
      case '/home_search':
        return MaterialPageRoute(builder: (_) => SearchScreen());

    }
    return null;
  }
}
