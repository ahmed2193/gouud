class BestSellerModel {
  String productName;
  String departmentName;
  String price;
  double rate;
  String photoUrl;
  String navigationUrl;

  BestSellerModel(
      {this.productName,
      this.departmentName,
      this.price,
      this.rate,
      this.photoUrl,
      this.navigationUrl});

  BestSellerModel.fromJson(Map<String, dynamic> json) {
    productName = json['ProductName'];
    departmentName = json['DepartmentName'];
    price = json['Price'];
    rate = json['Rate'];
    photoUrl = json['PhotoUrl'];
    navigationUrl = json['NavigationUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductName'] = this.productName;
    data['DepartmentName'] = this.departmentName;
    data['Price'] = this.price;
    data['Rate'] = this.rate;
    data['PhotoUrl'] = this.photoUrl;
    data['NavigationUrl'] = this.navigationUrl;
    return data;
  }
}
