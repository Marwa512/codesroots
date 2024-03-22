import 'package:codesroots/core/widgets/text_style.dart';
import 'package:codesroots/features/doctor_api/presentation/bloc/doctor_cubit.dart';
import 'package:codesroots/features/doctor_api/presentation/bloc/doctor_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../widgets/doctor_widget.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Browse doctors",
          style: GoogleFonts.itim(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(title:"Find your Doctor"),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Search",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<DoctorCubit, DoctorStates>(
                  buildWhen: (_, state) =>
                      state is GetDoctorLoadingState ||
                      state is GetDoctorSuccessState ||
                      state is GetDoctorFailurState,
                  builder: (_, state) {
                    return ConditionalBuilder(
                        condition: state is! GetDoctorLoadingState,
                        builder: (context) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return doctorItem(
                                  DoctorCubit.get(context).doctorModel[index], context);
                            },
                            itemCount:
                                DoctorCubit.get(context).doctorModel.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                          );
                        },
                        fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                  }),
              
            ],
          ),
        ),
      ),
    );
  }
}

