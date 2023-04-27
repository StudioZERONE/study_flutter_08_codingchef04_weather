import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;

  const WeatherScreen({
    super.key,
    this.parseWeatherData,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = '';
  int temp = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('--------- widget.parseWeatherData : $widget.parseWeatherData');
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();
    print('--------- temp : $temp');

    cityName = weatherData['name'];
    print('--------- cityName : $cityName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$temp',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
