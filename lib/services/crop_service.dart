import 'package:agro_port/config.dart';
import 'package:agro_port/models/crop.dart';
import 'package:agro_port/utils/custom_http.dart';

class CropService {
  static Future<List<Crop>> getAllCrop() async {
    try {
      final response =
          await CustomHttp.getDio().get(GlobalData.baseUrl + "/api/Crop/All");
      // print(response.data);
      if (response.statusCode == 200) {
        return (response.data["result"] as List<dynamic>)
            .map((d) => Crop.fromJson(d as Map<String, dynamic>))
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
