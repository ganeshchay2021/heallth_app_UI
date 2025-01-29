import 'package:flutter/material.dart';
import 'package:healhapp_ui/Data/colors.dart';
import 'package:healhapp_ui/Model/schedule_model.dart';
import 'package:healhapp_ui/domain/ui_helper.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String selectedOption = "Upcomming";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  UiHelper.customIcon(icon: Icons.arrow_back_ios),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.customText(
                        text: "Schedule",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 35,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    _buildOption("Upcomming"),
                    _buildOption("Completed"),
                    _buildOption("Result")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: buildContent())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 25, top: 14, bottom: 14),
      decoration: BoxDecoration(
          color: selectedOption == option ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = option;
          });
        },
        child: UiHelper.customText(
            text: option,
            fontWeight:
                selectedOption == option ? FontWeight.bold : FontWeight.normal,
            color: selectedOption == option ? Colors.white : Colors.black45),
      ),
    );
  }

  Widget buildContent() {
    if (selectedOption == "Upcomming") {
      return buildUpComming();
    } else if (selectedOption == "Completed") {
      return buildCompleted();
    } else if (selectedOption == "Result") {
      return buildResult();
    }
    return const SizedBox.shrink();
  }

  Widget buildUpComming() {
    return ListView.builder(
      itemCount: scheduleDoctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 220,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.circular(15),
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: UiHelper.networkImage(
                              image: scheduleDoctors[index].profile,
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
                              text: scheduleDoctors[index].name,
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          UiHelper.customText(
                              text: scheduleDoctors[index].position,
                              fontSize: 15,
                              color: Colors.black45,
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
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.calendar_1,
                          color: Colors.black45,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        UiHelper.customText(
                          text: scheduleDoctors[index].date,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        const Icon(
                          Iconsax.timer_1,
                          color: Colors.black45,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        UiHelper.customText(
                            text: scheduleDoctors[index].time,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        width: 125,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kPrimaryColor)),
                        child: UiHelper.customText(
                            text: "Cancel", fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 35,
                        width: 125,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: kPrimaryColor)),
                        child: UiHelper.customText(
                            color: Colors.white,
                            text: "Reshedule",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCompleted() {
    return Container(
      child: Center(
        child: UiHelper.customText(
            text: "No Appointment Schedule Completed",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87),
      ),
    );
  }

  Widget buildResult() {
    return Container(
      child: Center(
        child: UiHelper.customText(
            text: "No Appointment Schedule",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87),
      ),
    );
  }
}
