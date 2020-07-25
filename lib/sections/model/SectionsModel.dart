class SectionsModel {
  String name;
  String photoUrl;
  String brandsUrl;

  SectionsModel({this.name, this.photoUrl, this.brandsUrl});

  SectionsModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    photoUrl = json['PhotoUrl'];
    brandsUrl = json['BrandsUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['PhotoUrl'] = this.photoUrl;
    data['BrandsUrl'] = this.brandsUrl;
    return data;
  }
}
