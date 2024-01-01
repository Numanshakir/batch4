import 'package:batch4/WeatherApp/Common/custom_text.dart';
import 'package:batch4/WeatherApp/Home/View/Components/forcast_data.dart';
import 'package:batch4/WeatherApp/Home/View/Components/today_weather_info.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          title: CustomText(
            title: "Today",
            fontSize: 25,
            fontWeight: FontWeight.w600,
          )),
      // backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        title: "punjab, pakistan",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: "Monday, Jan 01 2024",
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "23",
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            title: "o",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            title: "C",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      CustomText(
                        title: "Clear Sky",
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TodayWeatherInfo(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: "7 Day Forcast",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ForcastData()
                ],
              ),
            ),
          )),
    );
  }
}
