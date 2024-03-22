import 'package:codesroots/features/doctor_api/data/dataresources/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_networking/AppException.dart';

import '../../data/model/doctor_model.dart';
import 'doctor_states.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitialState());
  static DoctorCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> doctorModel = [];
  void getDoctorsList() {
    doctorModel = [];
    emit(GetDoctorLoadingState());

    DioHelper.postData(url: "/doctors/doctorFilter", data: {}).then((value) {
      for (int i = 0; i < value['data'].length; i++) {
        doctorModel.add(DoctorModel.fromJson(value['data'][i]));
      }
      emit(GetDoctorSuccessState(doctorModel));
    }).catchError((error) {
      if (error is AppException) {
        emit(GetDoctorFailurState(error.beautifulMsg ?? ''));
      } else {
        emit(GetDoctorFailurState(error.toString()));
      }
    });
  }
}
