class ProductsModel {
  String brandName;
  int totalNumberOfProducts;
  List<ProductsCards> productsCards;

  ProductsModel(
      {this.brandName, this.totalNumberOfProducts, this.productsCards});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    brandName = json['BrandName'];
    totalNumberOfProducts = json['TotalNumberOfProducts'];
    if (json['ProductsCards'] != null) {
      productsCards = new List<ProductsCards>();
      json['ProductsCards'].forEach((v) {
        productsCards.add(new ProductsCards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BrandName'] = this.brandName;
    data['TotalNumberOfProducts'] = this.totalNumberOfProducts;
    if (this.productsCards != null) {
      data['ProductsCards'] =
          this.productsCards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsCards {
  String productName;
  String departmentName;
  String price;
  double rate;
  String photoUrl;
  String navigationUrl;

  ProductsCards(
      {this.productName,
      this.departmentName,
      this.price,
      this.rate,
      this.photoUrl,
      this.navigationUrl});

  ProductsCards.fromJson(Map<String, dynamic> json) {
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
