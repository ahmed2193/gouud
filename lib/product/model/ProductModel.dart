class ProductModel {
  List<ProductFiles> productFiles;
  List<ProductAttributes> productAttributes;
  String productName;
  String productDescription;
  String productPrice;
  double productRate;
  int productID;

  ProductModel(
      {this.productFiles,
      this.productAttributes,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productRate,
      this.productID});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['ProductFiles'] != null) {
      productFiles = new List<ProductFiles>();
      json['ProductFiles'].forEach((v) {
        productFiles.add(new ProductFiles.fromJson(v));
      });
    }
    if (json['ProductAttributes'] != null) {
      productAttributes = new List<ProductAttributes>();
      json['ProductAttributes'].forEach((v) {
        productAttributes.add(new ProductAttributes.fromJson(v));
      });
    }
    productName = json['ProductName'];
    productDescription = json['ProductDescription'];
    productPrice = json['ProductPrice'];
    productRate = json['ProductRate'];
    productRate = json['ProductRate'];
    productID = json['ProductID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productFiles != null) {
      data['ProductFiles'] = this.productFiles.map((v) => v.toJson()).toList();
    }
    if (this.productAttributes != null) {
      data['ProductAttributes'] =
          this.productAttributes.map((v) => v.toJson()).toList();
    }
    data['ProductName'] = this.productName;
    data['ProductDescription'] = this.productDescription;
    data['ProductPrice'] = this.productPrice;
    data['ProductRate'] = this.productRate;
    return data;
  }
}

class ProductFiles {
  String filePath;
  int fileType;

  ProductFiles({this.filePath, this.fileType});

  ProductFiles.fromJson(Map<String, dynamic> json) {
    filePath = json['FilePath'];
    fileType = json['FileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FilePath'] = this.filePath;
    data['FileType'] = this.fileType;
    return data;
  }
}

class ProductAttributes {
  String attributeName;
  String attributeValue;

  ProductAttributes({this.attributeName, this.attributeValue});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    attributeName = json['AttributeName'];
    attributeValue = json['AttributeValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AttributeName'] = this.attributeName;
    data['AttributeValue'] = this.attributeValue;
    return data;
  }
}
