import 'package:country_dictionary_test/model/country.dart';
import 'package:country_dictionary_test/model/detail.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';

//
// use dio, retrofit packages
@RestApi(baseUrl: 'https://restcountries.com/v2/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('all')
  Future<List<Country>> getCountries(@DioOptions() Options options);
  // api or database should use future, asyn function

  @GET('name/{name}?fullText=true')
  Future<List<Detail>> getDetail(
      @Path() String name, @DioOptions() Options options);
}
