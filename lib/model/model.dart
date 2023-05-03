import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    String iconFile = '';
    if (condition < 300) {
      iconFile = 'svg/climacon-cloud_lightning.svg';
    } else if (condition < 600) {
      iconFile = 'svg/climacon-cloud_snow_alt.svg';
    } else if (condition == 800) {
      iconFile = 'svg/climacon-sun.svg';
    } else if (condition <= 804) {
      iconFile = 'svg/climacon-cloud_sun.svg';
    }
    print('--------- Weather iconFile : $iconFile');
    return SvgPicture.asset(
      iconFile,
      color: Colors.black87,
    );
  }

  Widget getAirIcon(int index) {
    String iconFile = '';
    if (index == 1) {
      iconFile = 'images/good.png';
    } else if (index == 2) {
      iconFile = 'images/fair.png';
    } else if (index == 3) {
      iconFile = 'images/moderate.png';
    } else if (index == 4) {
      iconFile = 'images/poor.png';
    } else if (index == 5) {
      iconFile = 'images/bad.png';
    }
    print('--------- Air iconFile : $iconFile');
    return Image.asset(
      'images/good.png',
      width: 37,
      height: 35,
    );
  }

  Widget getAirCondition(int index) {
    String airText = "";
    Color airColor = Colors.white;
    if (index == 1) {
      airText = '"매우 좋음"';
      airColor = Colors.indigo;
    } else if (index == 2) {
      airText = '"좋음"';
      airColor = Colors.indigo;
    } else if (index == 3) {
      airText = '"보통"';
      airColor = Colors.black87;
    } else if (index == 4) {
      airText = '"나쁨"';
      airColor = Colors.black87;
    } else if (index == 5) {
      airText = '"매우 나쁨"';
      airColor = Colors.black87;
    }
    print('--------- airText : $airText');
    print('--------- airColor : $airColor');
    return Text(
      airText,
      style: TextStyle(
        color: airColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
