import 'package:design_project/shared/constants.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
  }
}
