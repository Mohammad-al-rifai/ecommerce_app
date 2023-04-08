class LoginModel {
  String? message;
  String? status;
  LoginData? data;

  LoginModel({this.message, this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
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

class LoginData {
  LoginUser? user;
  String? token;

  LoginData({this.user, this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? LoginUser.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class LoginUser {
  String? sId;
  String? name;
  String? email;
  String? location;
  String? phone;
  bool? blocked;
  int? role;
  bool? activited;

  LoginUser(
      {this.sId,
      this.name,
      this.email,
      this.location,
      this.phone,
      this.blocked,
      this.role,
      this.activited});

  LoginUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
    phone = json['phone'];
    blocked = json['blocked'];
    role = json['role'];
    activited = json['activited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['location'] = location;
    data['phone'] = phone;
    data['blocked'] = blocked;
    data['role'] = role;
    data['activited'] = activited;
    return data;
  }
}
