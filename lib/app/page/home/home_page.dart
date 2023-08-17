import 'package:UpTech/app/modules/finance/finance_module.dart';
import 'package:UpTech/app/modules/general/general_module.dart';
import 'package:UpTech/app/modules/notification/notification_module.dart';
import 'package:UpTech/app/modules/profile/profile_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {},
          child: currentIndex == 0
              ? GeneralModule()
              : currentIndex == 1 ? NotificationModule()
              : currentIndex == 2 ? FinanceModule()
              : ProfileModule()),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => setState(() => currentIndex = newIndex),
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 25,
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: SvgPicture.asset(
                  'assets/images/ic_bottom_home.svg',
                  alignment: Alignment.center,
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                  allowDrawingOutsideViewBox: true,
                  colorFilter: currentIndex == 0
                      ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                      : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
              label: "Notification",
              icon: SvgPicture.asset(
                'assets/images/ic_bottom_notification.svg',
                alignment: Alignment.center,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
                allowDrawingOutsideViewBox: true,
                colorFilter: currentIndex == 1
                    ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              label: "Finance",
              icon: SvgPicture.asset(
                'assets/images/ic_bottom_finances.svg',
                alignment: Alignment.center,
                width: 28,
                height: 28,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.cover,
                colorFilter: currentIndex == 2
                    ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: SvgPicture.asset(
                'assets/images/ic_bottom_profile.svg',
                alignment: Alignment.center,
                width: 28,
                height: 28,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.cover,
                colorFilter: currentIndex == 3
                    ? ColorFilter.mode(Color(0xff0D6EFD), BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
          ]),
    );
  }
}
