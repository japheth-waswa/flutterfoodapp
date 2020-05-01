
import 'dart:io';

import 'package:flutter/material.dart';

class Helpers {
  
  static platformIcon(context, platformIcon) {
    var platformIconsList = {
      'arrowBack': {
        'android': Icons.arrow_back,
        'ios': Icons.arrow_back_ios,
      },
    };
    if (Platform.isIOS && platformIconsList[platformIcon] != null) {
      return platformIconsList[platformIcon]['ios'];
    } else if (Platform.isAndroid && platformIconsList[platformIcon] != null) {
      return platformIconsList[platformIcon]['android'];
    }
  }

}