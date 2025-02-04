import 'dart:io';

import 'package:dio/dio.dart';

class DioService {
  Future getMethod(String url) async {
    Dio dio = Dio();
    // dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(
              contentType: ContentType.json.toString(),
              responseType: ResponseType.json,
              method: 'GET',
            ))
        .then(
      (response) {
        return response;
      },
    );
  }
}
