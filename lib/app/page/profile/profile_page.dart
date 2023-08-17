import 'package:UpTech/common/app_dimens.dart';
import 'package:UpTech/main.dart';
import 'package:UpTech/tool/preference_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final authenticated = getIt<PreferenceUtils>().getBool(PreferenceUtils.checkUserLogin);
  @override
  void initState() {
    super.initState();
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Your Profile'),
        ),
        body: authenticated ? ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            ProfileUser(),
            Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            Container(
              padding:
              EdgeInsets.only(left: 20, right: 30, top: 15, bottom: 15),
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
              child: Column(
                children: [
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_user.svg',
                    'Profile',
                    true,
                  ),
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_cart.svg',
                    'My Cart',
                    true,
                  ),
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_favorite.svg',
                    'Favorite',
                    true,
                  ),
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_orders.svg',
                    'Orders',
                    true,
                  ),
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_notifications.svg',
                    'Notifications',
                    true,
                  ),
                  ItemProfile(
                    context,
                    'assets/icon/ic_profile_setting.svg',
                    'Settings',
                    true,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemProfile(
                      context,
                      'assets/icon/ic_profile_sign_out.svg',
                      'Sign Out',
                      false,
                    )
                  ]
              ),
            ),
          ],
        ) : Center(child: ElevatedButton.icon(
            onPressed: () {
              Modular.to.pushNamed('/login');
            },
            icon: Icon( // <-- Icon
              Icons.login,
              size: 24.0,),
            label: Text('Đăng nhập'))),
      ),
    );
  }
}

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius:
                  BorderRadius.circular(AppDimens.widthChangeAvtar(context)),
                  child: Image.network(
                    'https://www.geog.ucl.ac.uk/study/graduate-taught/msc-social-and-geographic-data-science/images/Network-large.jpg',
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
                        'Phan Anh',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '0393397641',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'nguyenhuuthao200@gmail.com',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),

                    ],
                  )
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 5, bottom: 5),
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: null,
                  child: const Text('Điểm tích lũy: 1520'),
                )
              ]
          ),
        ),
      ],
    );
  }
}

Widget ItemProfile(BuildContext context, String iconItem, String textContent,
    bool iconMore) {
  return GestureDetector(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoadingPage()),
        );*/
        Navigator.of(context).pushNamed('/setting');
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
