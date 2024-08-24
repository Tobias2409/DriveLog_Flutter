import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DelimiterHelper{

  static const _platform = MethodChannel('at.tobias-schiffelhumer.at/number');

  static String? _delimiter;

  static Future<String> getDelimiter(BuildContext context) async{

    if(_delimiter == null){
      if(Platform.isIOS){
        final result = await _platform.invokeMethod<String>('getDecimalSeparator');
        _delimiter = result ?? ".";
      }
      else {
        Locale locale = Localizations.localeOf(context);
        _delimiter = NumberFormat.decimalPattern(locale.toString()).toString();
      }
    }

    return _delimiter!;
  }
}