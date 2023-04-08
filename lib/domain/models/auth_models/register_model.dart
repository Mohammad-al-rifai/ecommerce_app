class RegisterModel {
  String? message;
  String? status;
  RegisterData? data;

  RegisterModel({this.message, this.status, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
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

class RegisterData {
  RegisterUser? user;
  String? token;
  String? pin;

  RegisterData({this.user, this.token, this.pin});

  RegisterData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? RegisterUser.fromJson(json['user']) : null;
    token = json['token'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['pin'] = pin;
    return data;
  }
}

class RegisterUser {
  String? sId;
  String? name;
  String? password;
  String? email;
  String? location;
  String? phone;
  bool? blocked;
  int? role;
  bool? activited;

  RegisterUser(
      {this.sId,
      this.name,
      this.password,
      this.email,
      this.location,
      this.phone,
      this.blocked,
      this.role,
      this.activited});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    password = json['password'];
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
    data['password'] = password;
    data['email'] = email;
    data['location'] = location;
    data['phone'] = phone;
    data['blocked'] = blocked;
    data['role'] = role;
    data['activited'] = activited;
    return data;
  }
}
