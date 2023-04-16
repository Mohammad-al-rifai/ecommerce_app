class RegisterRequest {
  late String firstName;
  late String lastName;
  late String password;
  late String email;
  late String address;
  late String pin;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.address,
    required this.pin,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    address = json['address'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['email'] = email;
    data['address'] = address;
    data['pin'] = pin;
    return data;
  }
}
