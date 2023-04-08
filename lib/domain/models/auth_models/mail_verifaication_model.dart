class MailVerificationModel {
  String? message;
  String? status;
  String? pin;

  MailVerificationModel({this.message, this.status, this.pin});

  MailVerificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['pin'] = pin;
    return data;
  }
}
