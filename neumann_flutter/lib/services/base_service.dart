import 'package:get/get.dart';

// class BaseService extends GetConnect with CacheManager {
//   @override
//   void onInit() {
//     var token = getToken();
//     httpClient.baseUrl = "http://10.0.2.2:3000/";
//     httpClient.defaultContentType = "application/json";
//     httpClient.timeout = const Duration(seconds: 10);
//     httpClient.addResponseModifier((request, response) async {
//       print(response.body);
//     });
//     var headers = {'Authorization': "$token"};
//     httpClient.addAuthenticator<dynamic>((request) async {
//       request.headers.addAll(headers);
//       return request;
//     });
//     super.onInit();
//   }
// }
