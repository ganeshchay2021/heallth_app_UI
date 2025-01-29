import 'package:flutter/material.dart';
import 'package:healhapp_ui/Screens/home/widgets/doctor_profile.dart';
import 'package:healhapp_ui/Screens/home/widgets/health_needs.dart';
import 'package:healhapp_ui/Screens/home/widgets/near_by_doctors.dart';
import 'package:healhapp_ui/domain/ui_helper.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.customText(text: "Hi Ganesh", fontWeight: FontWeight.bold),
            UiHelper.customText(
              text: "How are you feeling today",
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Colors.black45,
            ),
          ],
        ),
        actions: [
          UiHelper.customIcon(icon: Iconsax.notification, iconSize: 25),
          const SizedBox(width: 15),
          UiHelper.customIcon(icon: Iconsax.search_normal, iconSize: 25),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const DoctorProfile(),
          const SizedBox(
            height: 30,
          ),
          UiHelper.customText(
            text: "Health Needs",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          const HealthNeeds(),
          const SizedBox(
            height: 20,
          ),
          UiHelper.customText(
            text: "Nearby Doctors",
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          const NearByDoctors()
        ],
      ),
    );
  }
}
