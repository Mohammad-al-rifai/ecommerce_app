class RegisterModel {
  String? message;
  bool? status;
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

  RegisterData({this.user, this.token});

  RegisterData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? RegisterUser.fromJson(json['user']) : null;
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

class RegisterUser {
  String? sId;
  String? fullName;
  String? email;
  int? role;
  String? address;
  String? updatedAt;
  String? createdAt;
  int? iV;

  RegisterUser(
      {this.sId,
      this.fullName,
      this.email,
      this.role,
      this.address,
      this.updatedAt,
      this.createdAt,
      this.iV});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['email'] = email;
    data['role'] = role;
    data['address'] = address;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
