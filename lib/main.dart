import 'package:country_dictionary_test/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'api/apiservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.interceptors.add(
      LogInterceptor(responseBody: true, logPrint: (log) => print(log)),
    );
    ApiService apiService = ApiService(dio);
    Get.put(apiService);
    return GetMaterialApp(
      home: Home(),
    );
  }
}
