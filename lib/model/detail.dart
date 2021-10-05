import 'package:json_annotation/json_annotation.dart';
part 'detail.g.dart';

@JsonSerializable()
class Detail {
  String name;
  String region;
  String subregion;
  String aplha2Code;
  int population;
  String demonym;

  Detail(this.name, this.region, this.subregion, this.aplha2Code,
      this.population, this.demonym);

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
