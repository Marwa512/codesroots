import 'package:codesroots/core/widgets/button_widget.dart';
import 'package:codesroots/features/doctor_api/presentation/bloc/doctor_cubit.dart';
import 'package:codesroots/features/product_api/presentation/bloc/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../doctor_api/presentation/pages/doctor_screen.dart';
import '../../../product_api/presentation/pages/product_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonWidget(
                onTap: () {
                  DoctorCubit.get(context).getDoctorsList();
                  Get.to(const DoctorScreen());
                },
                textColor: Colors.white,
                text: "Doctor Screen",
                buttonColor: mainColor),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
                onTap: () {
                  ProductsCubit.get(context).getData();
                  Get.to( ProductScreen());
                },
                textColor: Colors.white,
                text: "Product Screen",
                buttonColor: mainColor),
          ],
        ),
      ),
    );
  }
}
