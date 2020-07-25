class SectionProductsModel {
  List<Data> data;
  bool status;
  String message;
  int count;
  int currentPage;

  SectionProductsModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  SectionProductsModel.fromJson(Map<String, dynamic> json) {
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
  String departmentId;
  Department department;
  List<ProductsData> product;
  String image;

  Data(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.description,
      this.departmentId,
      this.department,
      this.product,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    description = json['description'];
    departmentId = json['department_id'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    if (json['product'] != null) {
      product = new List<ProductsData>();
      json['product'].forEach((v) {
        product.add(new ProductsData.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['department_id'] = this.departmentId;
    if (this.department != null) {
      data['department'] = this.department.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class Department {
  int id;
  String nameEn;
  String nameAr;
  String description;
  String image;

  Department({this.id, this.nameEn, this.nameAr, this.description, this.image});

  Department.fromJson(Map<String, dynamic> json) {
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

class ProductsData {
  int id;
  String nameEn;
  String nameAr;
  List<Images> images;
  String discount;
  String price;
  double rate;

  ProductsData(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.images,
      this.discount,
      this.price,
      this.rate});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    discount = json['discount'];
    price = json['price'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['rate'] = this.rate;
    return data;
  }
}

class Images {
  int id;
  String productId;
  String image;

  Images({this.id, this.productId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    return data;
  }
}
