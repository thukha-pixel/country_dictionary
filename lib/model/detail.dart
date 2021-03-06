import 'package:json_annotation/json_annotation.dart';
part 'detail.g.dart';

@JsonSerializable()
class Detail {
  String name;
  String region;
  String subregion;
  String alpha2Code;
  int population;
  String demonym;
  List? borders;

  Detail(this.name, this.region, this.subregion, this.alpha2Code,
      this.population, this.demonym,
      {this.borders});

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
