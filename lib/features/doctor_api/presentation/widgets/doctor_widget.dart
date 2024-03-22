import 'package:codesroots/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_style.dart';
import '../../data/model/doctor_model.dart';

Widget doctorItem(DoctorModel doctor, context) {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
        color: lightGrey, borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Image(
            image: NetworkImage(
                "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?t=st=1710981734~exp=1710985334~hmac=44f183b844e6f837875155b53aaf7d3b861fd64d3049e9886896119a6e1ef413&w=740"),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    title: "Full name:${doctor.firstName} ${doctor.lastName}"),
                TextWidget(title: "Number: ${doctor.mobile} "),
                TextWidget(title: "price: ${doctor.price}"),
                TextWidget(
                    title: doctor.biography != null
                        ? " Biography: ${doctor.biography}  "
                        : "Biography: none"),
                TextWidget(
                    title: doctor.category?[0].nameAr != null
                        ? " Category: ${doctor.category![0].nameAr} "
                        : "Category: none"),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_double_arrow_right_rounded,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
