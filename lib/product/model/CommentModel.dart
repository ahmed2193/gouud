import 'package:gouud/product/model/ProductModel.dart';

class CommentModel {
  List<Comments> data;
  bool status;
  String message;
  int count;
  int currentPage;

  CommentModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Comments>();
      json['data'].forEach((v) {
        data.add(new Comments.fromJson(v));
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
