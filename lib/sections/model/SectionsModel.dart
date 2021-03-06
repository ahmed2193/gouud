class SectionsModel {
  List<Data> data;
  bool status;
  String message;
  int count;
  int currentPage;

  SectionsModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  SectionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    count = json['count'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    data['current_page'] = this.currentPage;
    return data;
  }
}

class Data {
  int id;
  String nameEn;
  String nameAr;
  String description;
  String image;

  Data({this.id, this.nameEn, this.nameAr, this.description, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
