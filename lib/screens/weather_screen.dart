import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

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
  var date = DateTime.now();

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

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    cityName,
                    style: GoogleFonts.lato(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      TimerBuilder.periodic(
                        const Duration(minutes: 1),
                        builder: (context) {
                          print(getSystemTime());
                          return Text(
                            getSystemTime(),
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      Text(
                        DateFormat(' - EEEE').format(date),
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat(' - yyyy MMM dd').format(date),
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
