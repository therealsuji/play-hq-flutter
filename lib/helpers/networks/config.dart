import 'package:play_hq/helpers/networks/app_configurations.dart';
class ConfigData {

  //Base url and version are private and not exposed
  static String _rawgAPI;
  static String _baseUrl;
  static String _API_KEY = 'be9f8d00d9d04aa6b1b3f6ee26f305b4';
  static const _VERSION = "api-version=1";

  static void setBaseUrl(Environment environment){
    switch(environment){
      case Environment.DEV:
        _rawgAPI = "https://api.rawg.io/api";
        break;
      case Environment.QA:
        _rawgAPI = "https://api.rawg.io/api";
        break;
      case Environment.STAGE:
        _rawgAPI = "https://api.rawg.io/api";
        break;
    }
  }


  //authenticate user with email and passwordy**
  static String login = '$_baseUrl'+"/bgk/api/user/login";

  //register user with new account
  static String register = '$_baseUrl'+'/bgk/api/app/user/sign_up';

  //Get Item categories
  static String getCategories = '$_baseUrl'+'/bgk/api/app/product/get_all_categories';

  static String getGenres = '$_rawgAPI' + '/genres?ordering=&page=1&page_size=30&' +'key=$_API_KEY';

  static String getStreetDetails(String parameter){
    return '$_baseUrl'+'/bgk/api/app/delivery/all/query?text='+'$parameter';
  }

  //Get Prodict Details
  static String getProductDetails(String uuid , int page , int size){
    return '$_baseUrl'+'/bgk/api/app/product/find_by_category?productCategoryUuid=''$uuid''&page=''$page''&size=''$size';
  }

  //Resend OTP
  static String resendOTP(String otp){
    return '$_baseUrl'+'/bgk/api/user/resend/otp?token='+'$otp';
  }

  //Get OTP
  static String getOTP(String number){
    return '$_baseUrl' + '/bgk/api/app/user/get_otp?msisdn=' + '$number';
  }

  //Verify the OTP
  static String verifyOTP(String data , String otp){
    return '$_baseUrl' + '/bgk/api/app/user/verify/otp?token=' + '$data' + '&otp=' + '$otp';
  }

}