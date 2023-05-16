import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:neumann_flutter/model/login_request_model.dart';
import 'package:neumann_flutter/model/login_response_model.dart';

class LoginService extends GetConnect {
  final String loginUrl = 'http://10.0.2.2:3000/auth/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
