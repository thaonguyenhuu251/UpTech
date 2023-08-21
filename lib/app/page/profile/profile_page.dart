import 'package:UpTech/app/page/profile/profile_bloc.dart';
import 'package:UpTech/common/app_dimens.dart';
import 'package:UpTech/main.dart';
import 'package:UpTech/models/user/user.dart';
import 'package:UpTech/tool/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authenticated = getIt<PreferenceUtils>();
  String resultLogin = "";
  UserModel? userModel;
  ProfileBloc profileBloc = Modular.get<ProfileBloc>();
  @override
  void initState() {
    super.initState();
    loadData();
    setState(() {});
  }

  Future<void> loadData() async {
    if (authenticated.getBool(PreferenceUtils.checkUserLogin)) {
      await profileBloc.getProfiles(authenticated.getString(PreferenceUtils.userId));
      userModel = profileBloc.userModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Your Profile'),
        ),
        body: authenticated.getBool(PreferenceUtils.checkUserLogin)
            ? ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            profileUser(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.only(left: 20, right: 30, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFFF),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  ItemProfile(context, 'assets/icon/ic_profile_user.svg',
                      'Profile', true, 1),
                  ItemProfile(context, 'assets/icon/ic_profile_cart.svg',
                      'My Cart', true, 2),
                  ItemProfile(
                      context,
                      'assets/icon/ic_profile_favorite.svg',
                      'Favorite',
                      true,
                      3),
                  ItemProfile(
                      context,
                      'assets/icon/ic_profile_orders.svg',
                      'Orders',
                      true,
                      4),
                  ItemProfile(
                      context,
                      'assets/icon/ic_profile_notifications.svg',
                      'Notifications',
                      true,
                      5),
                  ItemProfile(
                      context,
                      'assets/icon/ic_profile_setting.svg',
                      'Settings',
                      true,
                      6),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFFF),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemProfile(
                        context,
                        'assets/icon/ic_profile_sign_out.svg',
                        'Sign Out',
                        false,
                        0)
                  ]),
            ),
          ],
        )
            : Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  _pushToLoginPage();
                },
                icon: const Icon(
                  Icons.login,
                  size: 24.0,
                ),
                label: Text('Đăng nhập'))),
      ),
    );
        }
    );
  }

  _pushToLoginPage() async {
    resultLogin = await Modular.to.pushNamed('/login') as String;
    if(resultLogin == "success") {
      setState(() {
        loadData();
      });
    }
  }


  Widget profileUser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(
                      AppDimens.widthChangeAvtar(context)),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/3/31/Red_Flower.png",
                    alignment: Alignment.center,
                    width: AppDimens.widthChangeAvtar(context),
                    height: AppDimens.widthChangeAvtar(context),
                    fit: BoxFit.cover,
                  )),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel?.userName ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userModel?.userPhone ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userModel?.userEmail ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.only(top: 1, bottom: 1),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: null,
              child: Text('Điểm tích lũy: ${userModel?.userPoint}'),
            )
          ]),
        ),
      ],
    );
  }

  Widget ItemProfile(BuildContext context, String iconItem, String textContent,
      bool iconMore, int typeScreen) {
    return GestureDetector(
        onTap: () {
          switch (typeScreen) {
            case 0:
              {
                profileBloc.signOut();
                setState(() {
                  authenticated.setBool(PreferenceUtils.checkUserLogin, false);
                });
              }
            case 4:
              {
                Navigator.of(context).pushNamed('/setting');
              }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 28,
                    height: 28,
                    margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),
                    child: SvgPicture.asset(
                      iconItem,
                      alignment: Alignment.center,
                      width: 28,
                      height: 28,
                      fit: BoxFit.fill,
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    )),
                Text(
                  textContent,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Visibility(
                visible: iconMore,
                child: SvgPicture.asset(
                  'assets/icon/ic_direction_left.svg',
                  alignment: Alignment.center,
                  width: 18,
                  height: 18,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                )),
          ],
        ));
  }
}
