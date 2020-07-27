class ProductModel {
  Data data;
  bool status;
  String message;
  int count;
  int currentPage;

  ProductModel(
      {this.data, this.status, this.message, this.count, this.currentPage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    count = json['count'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
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
  String descritpionEn;
  String descritpionAr;
  List<Images> images;
  dynamic discount;
  dynamic price;
  dynamic rate;
  String brandId;
  Brand brand;
  List<Comments> comments;

  Data(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.images,
      this.discount,
      this.price,
      this.rate,
      this.brandId,
      this.brand,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
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
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
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
  String descriptionEn;
  String descriptionAr;
  String departmentId;
  Department department;

  Brand(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.descriptionEn,
      this.descriptionAr,
      this.departmentId,
      this.department});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['descriptionEn'];
    descriptionAr = json['descriptionAr'];
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
    data['descriptionEn'] = this.descriptionEn;
    data['descriptionAr'] = this.descriptionAr;
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

class Comments {
  int id;
  String text;
  dynamic rate;
  String productId;
  User user;

  Comments({this.id, this.text, this.rate, this.productId, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    rate = json['rate'];
    productId = json['product_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['rate'] = this.rate;
    data['product_id'] = this.productId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String phone;
  String countryId;
  dynamic country;
  String image;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.countryId,
      this.country,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    country = json['country'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['image'] = this.image;
    return data;
  }
}

class Country {
  int id;
  String nameAr;
  String nameEn;

  Country({this.id, this.nameAr, this.nameEn});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}
