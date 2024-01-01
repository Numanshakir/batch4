import 'package:batch4/WeatherApp/Common/custom_text.dart';
import 'package:batch4/WeatherApp/Home/View/Components/forcast_data.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
        title: "Search",
        fontSize: 25,
        fontWeight: FontWeight.w600,
      )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: ForcastData())
            ],
          ),
        ),
      ),
    );
  }
}
