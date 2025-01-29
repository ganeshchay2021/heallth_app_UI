import 'package:flutter/material.dart';
import 'package:healhapp_ui/Data/colors.dart';
import 'package:healhapp_ui/Model/doctor_model.dart';
import 'package:healhapp_ui/Model/schedule_model.dart';
import 'package:healhapp_ui/domain/ui_helper.dart';
import 'package:iconsax/iconsax.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                offset: const Offset(0, 20),
                blurRadius: 10,
                spreadRadius: 3)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: UiHelper.networkImage(
                          image: nearbyDoctors[0].profile,
                          boxFit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper.customText(
                          text: nearbyDoctors[0].name,
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      UiHelper.customText(
                          text: nearbyDoctors[0].position,
                          fontSize: 15,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 35,
                width: 260,
                decoration: BoxDecoration(
                    color: profileCardBgColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.calendar_1,
                      color: Colors.white,
                    ),
                    UiHelper.customText(
                      text: "Today",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    const Icon(
                      Iconsax.timer_1,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    UiHelper.customText(
                        text: scheduleDoctors[0].time,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
