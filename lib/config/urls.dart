class Urls {
  static const String baseUrl = 'http://192.168.170.232:3000';

  static const String filesUrl = '$baseUrl/api/download?fileName=';

  static const String login = '/user/Customer/auth';
  static const String register = '/user/Customer/SignUp';
  static const String forgetPassword = '/user/Customer/updatePassword';
  static const String mailVerify = '/user/sendCodeToCustomerEmail';
  static const String banners = '/user/allUser/getBanners';
  static const String getProfile = '/user/Customer/getProfile';
  static const String logout = '/user/allUsers/logout';
}
