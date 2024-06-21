import 'dart:convert';

import 'package:flutter/services.dart';

const platform_channel =
    MethodChannel('com.iexceed.equitas.consumer/bbpsMethodChannel');

handleJsonDecode(args) {
  try {
    dynamic jsonData = jsonDecode(args);
    return jsonData;
  } catch (e) {
    dynamic jsonData = '{"fromSuperApp":false,"flavor":"uat","apiData":"--"}';
    return jsonDecode(jsonData);
  }
}
