class Urls {
  static const String baseUrl = 'http://192.168.117.232:3000/user/';

  static const String filesUrl =
      'http://192.168.117.232:3000/api/download?fileName=';

  static const String login = 'Customer/auth';
  static const String register = 'Customer/SignUp';
  static const String forgetPassword = 'Customer/updatePassword';
  static const String mailVerify = 'sendCodeToCustomerEmail';
  static const String banners = 'allUser/getBanners';
}
