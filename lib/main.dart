import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:bbps/HttpClient.dart';
import 'package:bbps/Models/RedirectModal.dart';
import 'package:bbps/MyHomePage.dart';
import 'package:bbps/const.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // dynamic data =
  //     '{"fromSuperApp":false,"flavor":"uat","apiData":"?id=52537&hash=a2a4800cdf650bb2da65ecc8fd5deb2181c10b7bb3985b50b8b5e4501cf31f32ac5cb611bd0ccb8ee320004e3179990e5294ec496d7f4628f6c467712f4a4938"}';
  // dynamic args = handleJsonDecode(data);
  // final appResponse = RedirectModel.fromJson(args);

  // appRedirect(appResponse.apiData.toString(), appResponse.fromSuperApp,
  //     appResponse.flavor.toString());
  platform_channel.setMethodCallHandler((call) async {
    if (call.method.toString() == 'callBack') {
      dynamic args = jsonDecode(call.arguments);
      final appResponse = RedirectModel.fromJson(args);

      appRedirect(appResponse.apiData.toString(), appResponse.fromSuperApp,
          appResponse.flavor.toString());
    } else {
      appRedirect("-----IN ERROR FALLBACK-----", false, "uat");
    }

    return Future.value('okay');
  });
}

Future appRedirect(apiData, bool fromSuperApp, String flavor) async {
  return runApp(
    MediaQuery(
      data: MediaQueryData.fromView(ui.window),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(
            apiData: apiData, fromSuperApp: fromSuperApp, flavor: flavor),
      ),
    ),
  );
}
