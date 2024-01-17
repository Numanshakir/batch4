import 'package:batch4/WeatherApp/Common/custom_text.dart';
import 'package:batch4/WeatherApp/Home/View/Components/forcast_data.dart';
import 'package:batch4/WeatherApp/Home/View/Components/today_weather_info.dart';
import 'package:batch4/WeatherApp/Home/ViewModel/home_view_model.dart';
import 'package:batch4/WeatherApp/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeVM = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.fetchCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.searchView);
                },
                icon: Icon(Icons.search)),
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
                      Obx(
                        () => CustomText(
                          title: homeVM.myAddress.value,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: DateFormat.yMMMEd().format(DateTime.now()),
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
                          Obx(
                            () => CustomText(
                              title:
                                  homeVM.todayData.value.main.temp.toString(),
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
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
                  Obx(
                    () => Row(
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
                  ForcastData(
                    scrollPhysics: NeverScrollableScrollPhysics(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
