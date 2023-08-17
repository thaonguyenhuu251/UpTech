import 'package:UpTech/app/page/finance/finance_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinanceModule extends WidgetModule {
  GlobalKey<NavigatorState> _generalNavigator = GlobalKey();

  FinanceModule({super.key});
  @override
  List<Bind> get binds => [];

  @override
  Widget get view => Navigator(
    key: _generalNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FinanceScreen());
    }
    return null;
  }
}
