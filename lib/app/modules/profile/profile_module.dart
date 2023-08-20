import 'package:UpTech/app/page/profile/profile_bloc.dart';
import 'package:UpTech/app/page/profile/profile_page.dart';
import 'package:UpTech/app/page/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends WidgetModule {
  GlobalKey<NavigatorState> _profileNavigator = GlobalKey();

  ProfileModule({super.key});
  @override
  List<Bind> get binds => [
    Bind((i) => ProfileBloc(i()), isLazy: true, isSingleton: false),
  ];

  @override
  Widget get view => Navigator(
    key: _profileNavigator,
    initialRoute: '/',
    onGenerateRoute: generateRoute,
  );
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/setting':
        return MaterialPageRoute(builder: (_) => SettingScreen());
    }
    return null;
  }
}
