class Urls {
  static const String baseUrl = 'http://192.168.210.232:3000';

  static const String filesUrl = '$baseUrl/api/download?fileName=';

  static const String login = '/user/Customer/auth';
  static const String register = '/user/Customer/SignUp';
  static const String forgetPassword = '/user/Customer/updatePassword';
  static const String mailVerify = '/user/sendCodeToCustomerEmail';
  static const String banners = '/user/allUser/getBanners';
  static const String getProfile = '/user/Customer/getProfile';
  static const String logout = '/user/allUsers/logout';
  static const String getHotSelling = '/user/allUsers/getHotSelling';
  static const String getCategories = '/user/allUsers/getCategorie/';
  static const String getAllMerchants = '/user/allUsers/getAllMerchants/';
  static const String getMerchantProducts = '/user/allUsers/MerchantProducts/';
  static const String getGalleryProduct = '/user/allUsers/GalleryProduct/';
  static const String getVideoProduct = '/user/allUsers/getProduct/';
}
