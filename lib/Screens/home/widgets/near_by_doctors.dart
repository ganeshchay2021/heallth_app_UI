import 'package:flutter/material.dart';
import 'package:healhapp_ui/Model/doctor_model.dart';
import 'package:healhapp_ui/domain/ui_helper.dart';

class NearByDoctors extends StatelessWidget {
  const NearByDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyDoctors.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: 135,
            width: double.maxFinite,
            color: Colors.grey.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 125,
                        width: 120,
                        child: UiHelper.networkImage(
                          image: nearbyDoctors[index].profile,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiHelper.customText(
                            text: nearbyDoctors[index].name,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: 5,
                        ),
                        UiHelper.customText(
                            text: nearbyDoctors[index].position,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            UiHelper.customText(
                              text: "${nearbyDoctors[index].rating}",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            UiHelper.customText(
                              text: "(${nearbyDoctors[index].reviews} reviews)",
                              fontSize: 16,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
