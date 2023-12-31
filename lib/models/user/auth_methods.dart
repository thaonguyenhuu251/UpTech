import 'package:UpTech/models/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String? name,
    required String? phone,
    required String? email,
    required String? password,
    required int birthDay,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email,
            password: password!
        );

        UserModel userModel = UserModel(
            idUser: user.user!.uid,
            userName: name!,
            userBirthday: birthDay,
            userPhone: phone!,
            userEmail: email,
            userPassword: password,
            userPoint: 0,
            userImage: '');

        await firestore.collection('users').doc(user.user!.uid).set(
          userModel.toJson(),
        );
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}