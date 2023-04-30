class CategoriesModel {
  String? message;
  bool? status;
  List<CategoryData>? data;

  CategoriesModel({this.message, this.status, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  String? sId;
  String? imageOfCate;
  String? arName;
  String? enName;
  String? merchantId;
  bool? homePage;
  String? updatedAt;
  String? createdAt;
  int? iV;

  CategoryData(
      {this.sId,
      this.imageOfCate,
      this.arName,
      this.enName,
      this.merchantId,
      this.homePage,
      this.updatedAt,
      this.createdAt,
      this.iV});

  CategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageOfCate = json['ImageOfCate'];
    arName = json['arName'];
    enName = json['enName'];
    merchantId = json['MerchantId'];
    homePage = json['HomePage'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['ImageOfCate'] = imageOfCate;
    data['arName'] = arName;
    data['enName'] = enName;
    data['MerchantId'] = merchantId;
    data['HomePage'] = homePage;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
