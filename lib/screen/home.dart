import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_dictionary_test/api/apiservice.dart';
import 'package:country_dictionary_test/model/country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'detail_screen.dart';

class Home extends StatelessWidget {
  ApiService apiService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Country Dictionary")),
      body: FutureBuilder<List<Country>>(
        future: apiService.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Country>? country = snapshot.data;
            return ListView.builder(
              itemCount: country?.length,
              itemBuilder: (context, position) {
                return item(country![position], context);
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget item(Country country, context) {
    return Card(
      child: ListTile(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailScreen(apiService, country.name),
          //   ),
          // );
          Get.to(DetailScreen(country.name));
        },
        leading: CachedNetworkImage(
          imageUrl:
              "https://www.countryflags.io/${country.alpha2Code}/flat/64.png",
          placeholder: (_, __) => const CircularProgressIndicator(),
        ),
        title: Text(
          country.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(country.region),
      ),
    );
  }
}
