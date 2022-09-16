import 'package:flutter/material.dart';
import 'package:zionwebradio/empty.dart';

import 'package:zionwebradio/mobile.dart';
import 'package:zionwebradio/tablet.dart';
import 'package:zionwebradio/desktop.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // if (constraints.maxWidth < 500) {
      //   return Mobile();
      // } else {
      return Desktop();
    });
  }
}
//  else if (constraints.maxWidth < 1500) {
//         return Empty();
//       }