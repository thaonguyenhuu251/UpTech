import 'package:UpTech/app/app_controller.dart';
import 'package:UpTech/app/modules/authen/authen_module.dart';
import 'package:UpTech/app/modules/general/general_module.dart';
import 'package:UpTech/app/modules/primary/primary_module.dart';
import 'package:UpTech/services/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppController()),
    Bind((i) => Api()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: PrimaryModule()),
    ModuleRoute('/login', module: AuthenModule()),
  ];

}