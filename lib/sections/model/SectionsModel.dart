class SectionsModel {
  String name;
  String photoUrl;
  String navigationUrl;

  SectionsModel({this.name, this.photoUrl, this.navigationUrl});

  SectionsModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    photoUrl = json['PhotoUrl'];
    navigationUrl = json['NavigationUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['PhotoUrl'] = this.photoUrl;
    data['NavigationUrl'] = this.navigationUrl;
    return data;
  }
}
