import 'package:country_dictionary_test/screen/home.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
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
    //interceptor is like pipe
    dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: 'https://restcountries.com/v2/'))
            .interceptor);
    dio.interceptors.add(
      LogInterceptor(responseBody: true, logPrint: (log) => print(log)),
    ); // now, i can see all log in debug console
    ApiService apiService = ApiService(dio);
    Get.put(apiService);
    return GetMaterialApp(
      home: Home(),
    );
  }
}
