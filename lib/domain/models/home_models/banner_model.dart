class BannersModel {
  String? message;
  bool? status;
  BannerData? data;

  BannersModel({this.message, this.status, this.data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? BannerData.fromJson(json['data']) : null;
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

class BannerData {
  List<BannerItem>? banners;

  BannerData({this.banners});

  BannerData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannerItem>[];
      json['banners'].forEach((v) {
        banners!.add(BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerItem {
  String? sId;
  String? content;
  String? endDate;
  int? iV;

  BannerItem({this.sId, this.content, this.endDate, this.iV});

  BannerItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    endDate = json['endDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['endDate'] = endDate;
    data['__v'] = iV;
    return data;
  }
}
