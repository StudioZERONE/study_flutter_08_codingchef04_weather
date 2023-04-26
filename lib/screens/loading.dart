import 'package:flutter/material.dart';
import 'package:study_flutter_08_codingchef04_weather/data/my_location.dart';
import 'package:study_flutter_08_codingchef04_weather/data/network.dart';

//const apikey = 'OdOcc1131b44cd6ea0027e60e69dc007'; // 코딩쉐프의 OpenWeather API Key
const apikey = '1ad9396df086a1befad00d8f03028105'; // OpenWeather API Key

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3 = 0.0;
  double longitude3 = 0.0;

  @override
  void initState() {
    super.initState();
    getLocation(); //사용자가 앱을 실행하면, 즉시 위치 정보(경위도좌표)를 가져옴
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    print('--------- latitude3 : $latitude3');
    print('--------- longitude3 : $longitude3');

    // OpenWeather 의 API Key 발급받기 전에 사용한 더미 데이터
    // Network network = Network(
    //     'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey');

    //https: //api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=122.406417&appid=1ad9396df086a1befad00d8f03028105

    var weatherData = await network.getJsonData();
    print('--------- weatherData : $weatherData');

    // var myJson = weatherData['weather'][0]['description'];
    // print('--------- myJson : $myJson');

    // var wind = weatherData['wind']['speed'];
    // print('--------- wind : $wind');

    // var id = weatherData['id'];
    // print('--------- id : $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading..'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('Get my location'),
        ),
      ),
    );
  }
}
