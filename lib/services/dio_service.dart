import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    // dio.options.headers['content-Type'] = 'application/json'; // this is an othe option to set content-Type of the request
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

  Future<dynamic> postMethod(
      {required String url, required Map<String, dynamic> map}) async {
    //TODO: read token from shared preferences and set it to the header

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(
              responseType: ResponseType.json,
              contentType: ContentType.json.toString(),
              method: 'POST',
            ))
        .then(
      (value) {
        log(value.headers.toString(),
            name: 'dio post method headers'); // this is for debugging
        log(value.data.toString(),
            name: 'dio post method data'); // this is for debugging
        log(value.statusCode.toString(),
            name: 'dio post method statusCode'); // this is for debugging
        return value;
      },
    );
  }
}
