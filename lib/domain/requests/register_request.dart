class RegisterRequest {
  late String name;
  late String password;
  late String email;
  late String phone;
  late String location;
  late String address;

  RegisterRequest({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.location,
    required this.address,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['location'] = location;
    data['address'] = address;
    return data;
  }
}
