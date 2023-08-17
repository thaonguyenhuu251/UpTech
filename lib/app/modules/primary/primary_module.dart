import 'package:UpTech/app/page/home/home_bloc.dart';
import 'package:UpTech/app/page/home/home_page.dart';
import 'package:UpTech/app/page/search/search_page.dart';
import 'package:UpTech/app/page/signup/signup_page.dart';
import 'package:UpTech/app/page/webview/webview_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeBloc(), isLazy: true, isSingleton: false),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/webview', child: (_, args) => WebViewExample()),
    ChildRoute('/home_search', child: (_, args) => SearchScreen()),
    ChildRoute('/signup', child: (_, args) => SignUp()),
  ];
}
