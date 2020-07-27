class FavouriteModel {
  List<Data> data;
  bool status;
  String message;
  int count;
  int currentPage;

  FavouriteModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
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
  String productId;
  ProductData product;

  Data({this.id, this.productId, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'] != null
        ? new ProductData.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class ProductData {
  int id;
  String nameEn;
  String nameAr;
  List<Images> images;
  dynamic discount;
  dynamic price;
  dynamic rate;
  String brandId;
  Brand brand;

  ProductData(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.images,
      this.discount,
      this.price,
      this.rate,
      this.brandId,
      this.brand});

  ProductData.fromJson(Map<String, dynamic> json) {
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
    brandId = json['brand_id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
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
    data['brand_id'] = this.brandId;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
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

class Brand {
  int id;
  String nameEn;
  String nameAr;
  String description;
  String departmentId;
  Department department;

  Brand(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.description,
      this.departmentId,
      this.department});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    description = json['description'];
    departmentId = json['department_id'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
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
