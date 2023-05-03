class GetProfileModel {
  String? message;
  String? status;
  Data? data;

  GetProfileModel({this.message, this.status, this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? location;
  String? phone;
  int? rate;
  List<String>? rateInfo;

  User(
      {this.sId,
      this.name,
      this.email,
      this.location,
      this.phone,
      this.rate,
      this.rateInfo});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
    phone = json['phone'];
    rate = json['rate'];
    rateInfo = json['rate_info'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['location'] = location;
    data['phone'] = phone;
    data['rate'] = rate;
    data['rate_info'] = rateInfo;
    return data;
  }
}
