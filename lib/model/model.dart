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
    print('--------- iconFile : $iconFile');
    return SvgPicture.asset(
      iconFile,
      color: Colors.black87,
    );
  }
}
