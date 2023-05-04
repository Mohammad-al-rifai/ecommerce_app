class ProductGalleryModel {
  String? message;
  bool? status;
  ProductGalleryData? data;

  ProductGalleryModel({this.message, this.status, this.data});

  ProductGalleryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? ProductGalleryData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductGalleryData {
  ProductGallery? gallery;

  ProductGalleryData({this.gallery});

  ProductGalleryData.fromJson(Map<String, dynamic> json) {
    gallery = json['gallery'] != null
        ? ProductGallery.fromJson(json['gallery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (gallery != null) {
      data['gallery'] = gallery!.toJson();
    }
    return data;
  }
}

class ProductGallery {
  String? sId;
  List<String>? gallery;
  String? mainImage;

  ProductGallery({this.sId, this.gallery, this.mainImage});

  ProductGallery.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    gallery = json['gallery'].cast<String>();
    mainImage = json['mainImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['gallery'] = gallery;
    data['mainImage'] = mainImage;
    return data;
  }
}
