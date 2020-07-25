class CartModel {
  int orderID;
  String productName;
  String departmentName;
  double quantity;
  double unitPrice;
  double totalPrice;
  String currencyName;
  String productPhotoUrl;
  String removeProductFromCartUrl;

  CartModel(
      {this.orderID,
      this.productName,
      this.departmentName,
      this.quantity,
      this.unitPrice,
      this.totalPrice,
      this.currencyName,
      this.productPhotoUrl,
      this.removeProductFromCartUrl});

  CartModel.fromJson(Map<String, dynamic> json) {
    orderID = json['OrderID'];
    productName = json['ProductName'];
    departmentName = json['DepartmentName'];
    quantity = json['Quantity'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
    currencyName = json['CurrencyName'];
    productPhotoUrl = json['ProductPhotoUrl'];
    removeProductFromCartUrl = json['RemoveProductFromCartUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderID'] = this.orderID;
    data['ProductName'] = this.productName;
    data['DepartmentName'] = this.departmentName;
    data['Quantity'] = this.quantity;
    data['UnitPrice'] = this.unitPrice;
    data['TotalPrice'] = this.totalPrice;
    data['CurrencyName'] = this.currencyName;
    data['ProductPhotoUrl'] = this.productPhotoUrl;
    data['RemoveProductFromCartUrl'] = this.removeProductFromCartUrl;
    return data;
  }
}
