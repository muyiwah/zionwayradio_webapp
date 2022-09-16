import 'package:flutter/material.dart';
import 'package:zionwebradio/responsive_layout.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      theme: ThemeData(//platform: TargetPlatform.iOS,
          ),
      home: const ResponsiveLayout(),
    ),
  );
}
