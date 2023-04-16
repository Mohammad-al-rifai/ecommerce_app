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
  String? password;
  int? role;

  LoginUser({this.sId, this.password, this.role});

  LoginUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['password'] = password;
    data['role'] = role;
    return data;
  }
}
