import 'package:flutter/material.dart';
import 'package:healhapp_ui/Data/colors.dart';
import 'package:healhapp_ui/Screens/home/home_screen.dart';
import 'package:healhapp_ui/Screens/message/message_screen.dart';
import 'package:healhapp_ui/Screens/profile/profile_screen.dart';
import 'package:healhapp_ui/Screens/schedule/schedule_screen.dart';
import 'package:iconsax/iconsax.dart';

class HealthAppMainScreen extends StatefulWidget {
  const HealthAppMainScreen({super.key});

  @override
  State<HealthAppMainScreen> createState() => _HealthAppMainScreenState();
}

class _HealthAppMainScreenState extends State<HealthAppMainScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: true,
        iconSize: 30,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        elevation: 0,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home5), label: ""),
          BottomNavigationBarItem(icon: Icon(Iconsax.calendar_1), label: ""),
          BottomNavigationBarItem(icon: Icon(Iconsax.message), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}
