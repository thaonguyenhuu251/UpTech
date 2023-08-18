import 'package:UpTech/app/app_controller.dart';
import 'package:UpTech/models/user/auth_methods.dart';
import 'package:UpTech/models/user/user.dart';
import 'package:UpTech/services/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileBloc extends Disposable {
  final Api api;

  final AppController app = Modular.get<AppController>();
  ProfileBloc(this.api);

  UserModel? userModel;

  Future<void> signOut() async {
    app.setLoad(true);
    await FirebaseAuth.instance.signOut();
    app.setLoad(false);
  }

  getProfiles(String userId) async {
    app.setLoad(true);
    try {
      print(userId);
      await AuthMethods().firestore.collection("users").doc(userId).get().then((value) =>
        userModel = UserModel.fromJson(value.data()!)
      );
      print(userModel?.userEmail);
      app.setLoad(false);

    } catch (e) {
      AlertController.show("Error", e.toString(), TypeAlert.error);
      print(e);
      app.setLoad(false);
    }
  }

  @override
  void dispose() {}
}
