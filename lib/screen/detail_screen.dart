import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_dictionary_test/api/apiservice.dart';
import 'package:country_dictionary_test/model/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final ApiService apiService = Get.find();
  final String country_name;
  DetailScreen(this.country_name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country_name)),
      body: FutureBuilder<List<Detail>>(
          future: apiService.getDetail(country_name),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Detail detail = snapshot.data![0];
              return ListView(
                children: [
                  Center(
                      child: Text(
                    detail.name,
                    style: TextStyle(fontSize: 20),
                  )),
                  Text(
                    'region: ${detail.region}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'subregion: ${detail.subregion}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'population: ${detail.population}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'demonym: ${detail.demonym}',
                    style: TextStyle(fontSize: 20),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://www.countryflags.io/${detail.alpha2Code}/flat/64.png',
                    placeholder: (_, __) => CircularProgressIndicator(),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
