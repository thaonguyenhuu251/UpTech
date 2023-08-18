class UserModel {
  late String idUser;
  late String userName;
  late int userBirthday;
  late String userPhone;
  late String userEmail;
  late String userPassword;
  late int userPoint;
  late String userImage;

  UserModel({
    required this.idUser,
    required this.userName,
    required this.userBirthday,
    required this.userPhone,
    required this.userEmail,
    required this.userPassword,
    required this.userPoint,
    required this.userImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    idUser: json['idUser'] as String,
    userName: json['userName'] as String,
    userBirthday: json['userBirthday'] as int,
    userPhone: json['userPhone'] as String,
    userEmail: json['userEmail'] as String,
    userPassword: json['userPassword'] as String,
    userPoint: json['userPoint'] as int,
    userImage: json['userImage'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'idUser': idUser,
    'userName': userName,
    'userBirthday': userBirthday,
    'userPhone': userPhone,
    'userEmail': userEmail,
    'userPassword': userPassword,
    'imageUrl': userPoint,
    'userImage': userImage,
  };

}