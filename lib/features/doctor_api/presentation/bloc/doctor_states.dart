import 'package:codesroots/features/doctor_api/data/model/doctor_model.dart';

abstract class DoctorStates {}

class DoctorInitialState extends DoctorStates {}

class GetDoctorLoadingState extends DoctorStates {}

class GetDoctorSuccessState extends DoctorStates {

  List<DoctorModel>? doctor;
  GetDoctorSuccessState(this.doctor);
}

class GetDoctorFailurState extends DoctorStates {
  String? error;
  GetDoctorFailurState(this.error);
}
