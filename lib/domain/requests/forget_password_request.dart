class ForgetPasswordRequest {
  String? email;
  String? newPassword;
  String? pin;

  ForgetPasswordRequest({this.email, this.newPassword, this.pin});

  ForgetPasswordRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    newPassword = json['newPassword'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['newPassword'] = newPassword;
    data['pin'] = pin;
    return data;
  }
}
