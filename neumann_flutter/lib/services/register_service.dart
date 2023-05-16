import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

class RegisterService extends GetConnect {
  final String registerUrl = 'http://10.0.2.2:3000/auth/register';

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());
    print(response.statusCode);
    if (response.statusCode == HttpStatus.created) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
