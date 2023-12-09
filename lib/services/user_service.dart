import 'package:agro_port/config.dart';
import 'package:agro_port/models/user.dart';
import 'package:agro_port/utils/custom_http.dart';

class UserLoginService {
  static Future<List<User>> postUserLogin() async {
    try {
      final response = await CustomHttp.getDio()
          .post(GlobalData.baseUrl + "/api/User/login");
      // print(response.data);
      if (response.statusCode == 200) {
        return (response.data["result"] as List<dynamic>)
            .map((d) => User.fromJson(d as Map<String, dynamic>))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }
}
