class DoctorModel {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? mobile;
  String? nationalId;
  String? dateOfBirth;
  String? gender;
  String? address;
  int? price;
  String? biography;
  List<CategoryModel>? category;
  String? cities;
  int? v;
  List<ScheduleModel>? schedules;
  @override
  String toString() {
    return 'DoctorModel{id= $id, email= $email, password= $password, '
        'firstName= $firstName, lastName= $lastName, mobile= $mobile, '
        'nationalId= $nationalId, dateOfBirth= $dateOfBirth, gender= $gender, '
        'address= $address, price= $price, biography= $biography, '
        'category= $category, cities= $cities, v= $v, schedules= $schedules}';
  }

  DoctorModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.mobile,
    this.nationalId,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.price,
    this.biography,
    this.category,
    this.cities,
    this.v,
    this.schedules,
  });
  DoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = <ScheduleModel>[];
      json['schedules'].forEach((v) {
        schedules!.add(ScheduleModel.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <CategoryModel>[];
      json['category'].forEach((v) {
        category!.add(CategoryModel.fromJson(v));
      });
    }
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    nationalId = json['nationalId'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    address = json['address'];
    price = json['price'];
    biography = json['biography'];
    cities = json['cities'];
    v = json['__v'];
  }
}

class CategoryModel {
  String? id;
  String? nameAr;
  String? nameEn;
  int? v;
  @override
  String toString() {
    return 'CategoryModel{id= $id, nameAr= $nameAr, nameEn= $nameEn, v= $v}';
  }

  CategoryModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.v,
  });
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    v = json['__v'];
  }
}

class ScheduleModel {
  String? id;
  String? doctors;
  String? startTime;
  String? endTime;
  String? date;
  int? reserved;
  String? createdAt;
  String? updatedAt;
  int? v;
  ScheduleModel({
    this.id,
    this.doctors,
    this.startTime,
    this.endTime,
    this.date,
    this.reserved,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  ScheduleModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['_id'];
    doctors = json['doctors'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    date = json['date'];
    reserved = json['reserved'];
    v = json['__v'];
  }
}
