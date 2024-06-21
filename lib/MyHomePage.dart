import 'dart:io';

import 'package:bbps/const.dart';
import 'package:ebps/ebps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  final String apiData;
  final String flavor;
  final bool fromSuperApp;
  const MyHomePage(
      {super.key,
      required this.apiData,
      required this.flavor,
      required this.fromSuperApp});
  Future<void> triggerAppExit() async {
    try {
      if (Platform.isAndroid) {
        SystemNavigator.pop(animated: true);
      } else {
        platform_channel.invokeMethod("exitBbpsModule", "");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter AAR',
      home: SafeArea(
        minimum: const EdgeInsets.only(top: 30.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WillPopScope(
              onWillPop: () async => false,
              child: Center(
                  child: EbpsScreen(
                apiData: apiData,
                ctx: context,
                flavor: flavor,
                fromSuperApp: fromSuperApp,
                triggerAppExit: triggerAppExit,
              ))),
        ),
      ),
    );
  }
}
