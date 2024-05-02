class ProductResponse {
  int? status;
  String? message;
  Result? result;

  ProductResponse({this.status, this.message, this.result});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
}

class Result {
  List<Category>? category;

  Result({this.category});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['Category'] != null) {
      category = <Category>[];
      json['Category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }
}

class Category {
  int? id;
  String? name;
  int? isAuthorize;
  int? update080819;
  int? update130919;
  List<SubCategories>? subCategories;

  Category({this.id, this.name, this.isAuthorize, this.update080819, this.update130919, this.subCategories});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    isAuthorize = json['IsAuthorize'];
    update080819 = json['Update080819'];
    update130919 = json['Update130919'];
    if (json['SubCategories'] != null) {
      subCategories = <SubCategories>[];
      json['SubCategories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }
}

class SubCategories {
  int? id;
  String? name;
  List<Product>? product;

  SubCategories({this.id, this.name, this.product});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  String? name;
  String? priceCode;
  String? imageName;
  int? id;

  Product({this.name, this.priceCode, this.imageName, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    priceCode = json['PriceCode'];
    imageName = json['ImageName'];
    id = json['Id'];
  }
}
