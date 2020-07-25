class LoginModel {
  Data data;
  bool status;
  String message;
  int count;
  int currentPage;

  LoginModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    count = json['count'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    data['current_page'] = this.currentPage;
    return data;
  }
}

class Data {
  String token;
  Info info;

  Data({this.token, this.info});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  int id;
  String name;
  String email;
  String phone;
  String countryId;
  Country country;

  Info(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.countryId,
      this.country});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_id'] = this.countryId;
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    return data;
  }
}

class Country {
  int id;
  String nameAr;
  String nameEn;

  Country({this.id, this.nameAr, this.nameEn});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}
