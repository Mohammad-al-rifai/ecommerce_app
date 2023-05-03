class MerchantsModel {
  String? message;
  bool? status;
  MerchantData? data;

  MerchantsModel({this.message, this.status, this.data});

  MerchantsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? MerchantData.fromJson(json['data']) : null;
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

class MerchantData {
  List<MerchantUser>? user;

  MerchantData({this.user});

  MerchantData.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <MerchantUser>[];
      json['user'].forEach((v) {
        user!.add(MerchantUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MerchantUser {
  String? sId;
  String? marketName;
  String? marketLogo;

  MerchantUser({this.sId, this.marketName, this.marketLogo});

  MerchantUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    marketName = json['marketName'];
    marketLogo = json['marketLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['marketName'] = marketName;
    data['marketLogo'] = marketLogo;
    return data;
  }
}
