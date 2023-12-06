import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contenttype})async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contenttype,
            headers: {"Authorization": "Bearer $token",
            }));
    return response;
  }


}
