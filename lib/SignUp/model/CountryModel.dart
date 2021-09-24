// class CountryModel {
//   List<Data> data;
//   bool status;
//   String message;
//   int count;
//   int currentPage;
//   //  "Country_ID": 1,
//   //       "SortName": "AF",
//   //       "Name": "Afghanistan",
//   //       "NameAR": null,
//   //       "PhoneCode": 93,
//   //       "Users": []

//   CountryModel(
//       {this.data, this.status, this.message, this.count, this.currentPage});

//   CountryModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//     status = json['status'];
//     message = json['message'];
//     count = json['count'];
//     currentPage = json['current_page'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     data['message'] = this.message;
//     data['count'] = this.count;
//     data['current_page'] = this.currentPage;
//     return data;
//   }
// }

// class Data {
//   int id;
//   String nameAr;
//   String nameEn;

//   Data({this.id, this.nameAr, this.nameEn});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameAr = json['name_ar'];
//     nameEn = json['name_en'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_ar'] = this.nameAr;
//     data['name_en'] = this.nameEn;
//     return data;
//   }
// }
// class CountryModel {
//   List<Data> data;
  

//   CountryModel(
//       {  this.data, });

//   CountryModel.fromJson( dynamic json) {
//     if (json[1] != null) {
//       data = new List<Data>();
//       json[1].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//     // setdata(json['']);

//     // status = json['status'];
//     // name = json['Name'];
//     // countryID = json['Country_ID'];
//     // currentPage = json['current_page'];
//   }
//   // void setdata(List<Map<String,dynamic>> dataa){
//   //   this.data=[];
//   //   for(var item in dataa){
//   //     data.add(Data.fromJson(item));
//   //   }
//   // }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
  
//     return data;
//   }
// }

class Data {
    String name;
  var countryID;

  Data({this.name, this.countryID,});
  int getid() => this.countryID;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    countryID = json['Country_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['Name'] = this.name;
    data['Country_ID'] = this.countryID;
    return data;
  }
}
//  "Country_ID": 1,
//         "SortName": "AF",
//         "Name": "Afghanistan",
//         "NameAR": null,
//         "PhoneCode": 93,
//         "Users": []

