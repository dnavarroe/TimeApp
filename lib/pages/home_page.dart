import 'package:clima_app/controller/global_controller.dart';
import 'package:clima_app/utils/custom_color.dart';
import 'package:clima_app/widgets/comfort_level.dart';
import 'package:clima_app/widgets/current_weather_widget.dart';
import 'package:clima_app/widgets/daily_data_widget.dart';
import 'package:clima_app/widgets/header_widget.dart';
import 'package:clima_app/widgets/hourly_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //call
  final GlobalController globalcontroller =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalcontroller.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/clouds.png',
                        height: 200,
                        width: 200,
                      ),
                      const CircularProgressIndicator()
                    ],
                  ),
                )
              : Center(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(height: 20),
                      const HeaderWidget(),
                      CurrentWeather(
                        weatherDataCurrent: globalcontroller.getWeatherData().getCurrentWeather(),
                      ),
                      const SizedBox(height: 20),
                      HourlyDataWidget(
                        weatherDataHourly: globalcontroller.getWeatherData().getHourlyWeather(),
                      ),
                      DailyDataWidget(
                        weatherDataDaily: globalcontroller.getWeatherData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(height: 10),
                      ComfortLevel(weatherDataCurrent: globalcontroller.getWeatherData().getCurrentWeather())
                    ],
                  ),
              ))),
    );
  }
}
