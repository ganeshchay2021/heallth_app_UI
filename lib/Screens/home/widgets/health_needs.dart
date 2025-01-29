import 'package:flutter/material.dart';
import 'package:healhapp_ui/Data/colors.dart';
import 'package:healhapp_ui/Model/custom_icons.dart';
import 'package:healhapp_ui/domain/ui_helper.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                if (index == customIcons.length - 1) {
                  showBottomSheet(
                    // enableDrag: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 330,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiHelper.customText(
                              text: "Health Needs",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  List.generate(customIcons.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        color: secondaryBgColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: UiHelper.assetsImage(
                                        image: healthNeeds[index].icon,
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    UiHelper.customText(
                                        text: healthNeeds[index].name)
                                  ],
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            UiHelper.customText(
                              text: "Specialised Care",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  List.generate(customIcons.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        color: secondaryBgColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: UiHelper.assetsImage(
                                        image: specialisedCared[index].icon,
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    UiHelper.customText(
                                        text: specialisedCared[index].name)
                                  ],
                                );
                              }),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: secondaryBgColor,
                  shape: BoxShape.circle,
                ),
                child: UiHelper.assetsImage(
                  image: customIcons[index].icon,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            UiHelper.customText(text: customIcons[index].name)
          ],
        );
      }),
    );
  }
}
