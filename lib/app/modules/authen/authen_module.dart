import 'package:UpTech/app/page/login/login_page.dart';
import 'package:UpTech/app/page/signup/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenModule extends Module {
  @override
  List<Bind> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute('/signup', child: (_, args) => SignUp()),
  ];
}
