// import 'package:audioplayers/notifications.dart';
import 'package:zionwebradio/lottiescreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Desktop extends StatefulWidget {
  Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _Desktopstate();
}

class _Desktopstate extends State<Desktop> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool puasePressed = false;
// final androidConfig = FlutterBackgroundAndroidConfig (
//     notificationTitle: "flutter_background example app",
//     notificationText: "Background notification for keeping the example app running in the background",
//     notificationImportance: AndroidNotificationImportance.Default,
//     notificationIcon: AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
// );
//  bool success = await FlutterBackground.initialize(androidConfig: androidConfig);
  @override
  void initState() {
    if (mounted) {
      super.initState();
    }
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
        print(isPlaying);
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  } // AudioPlayer audioPlayer = AudioPlayer();

  bool pressed = false;
  int result = 0;
  String url = "https://stream.zeno.fm/n88bnx2a0xhvv";

  Future<void> isPlayPressed() async {
    if (isPlaying == false) {
      int res = await audioPlayer.play(url);
    } else {
      int ress = await audioPlayer.stop();
    }

    setState(
      () {
        if (pressed == true) {
          pressed = false;
        } else {
          pressed = true;
        }
        // if (pressed == true) {
        //   pressed = false;
        //   print(pressed);
        // }
      },
    );
  }

  void pausePlay() async {
    if (isPlaying == false) {
      await audioPlayer.play(url);
      print('playing');
    } else {
      await audioPlayer.pause();
      print('paused');
    }

    setState(
      () {
        if (puasePressed == true) {
//
          puasePressed = false;
        } else {
          puasePressed = true;
        }
        // if (pressed == true) {
        //   pressed = false;
        //   print(pressed);
        // }
      },
    );
  }

  void goToLink(index) async {
    print(index);
    if (index == 0) {
      final Uri url =
          Uri.parse('https://www.facebook.com/Zionwayradio-109645215221435/');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (index == 1) {
      final Uri url = Uri.parse(
          'https://twitter.com/zionwayradio?t=HiJ7uMYuSSHPnYn7PPEnSg&s=09');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (index == 2) {
      final Uri url = Uri.parse(
          'https://www.instagram.com/zionwayradio/?igshid=YmMyMTA2M2Y%3D');

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: Center(
          child: Text(
            'Zionway Radio',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'AkayaTelivigala'),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          goToLink(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 28),
            label: 'Facebook',
          ),
          BottomNavigationBarItem(
            icon:
                FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 28),
            label: 'Twitter',
          ),
          BottomNavigationBarItem(
            icon:
                FaIcon(FontAwesomeIcons.instagram, color: Colors.red, size: 28),
            label: 'Instagram',
          ),
        ],
      ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //         accountName: Text("Zion-Way Radio"),
      //         accountEmail: Text("Connect with us"),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundColor: Colors.white,
      //           child: Text(
      //             "ZR",
      //             style: TextStyle(fontSize: 40.0),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: FaIcon(FontAwesomeIcons.facebook,
      //             color: Colors.blue, size: 30),
      //         title: const Text(
      //           'Facebook',
      //         ),
      //         onTap: () async {
      //           final Uri url = Uri.parse(
      //               'https://www.facebook.com/Zionwayradio-109645215221435/');

      //           if (await canLaunchUrl(url)) {
      //             await launchUrl(url);
      //           } else {
      //             throw 'Could not launch $url';
      //           }
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: FaIcon(FontAwesomeIcons.instagram,
      //             color: Colors.red, size: 30),
      //         title: const Text(
      //           'Instagram',
      //         ),
      //         onTap: () async {
      //           final Uri url = Uri.parse(
      //               'https://instagram.com/zionwayradio?igshid=YmMyMTA2M2Y=');

      //           if (await canLaunchUrl(url)) {
      //             await launchUrl(url);
      //           } else {
      //             throw 'Could not launch $url';
      //           }
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const FaIcon(FontAwesomeIcons.twitter,
      //             color: Colors.blue, size: 30),
      //         title: const Text(
      //           'Twitter',
      //         ),
      //         // image: Image.asset('lib/icons/facebook.png'),
      //         onTap: () async {
      //           final Uri url = Uri.parse(
      //               'https://twitter.com/zionwayradio?t=HiJ7uMYuSSHPnYn7PPEnSg&s=09');

      //           if (await canLaunchUrl(url)) {
      //             await launchUrl(url);
      //           } else {
      //             throw 'Could not launch $url';
      //           }
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 237, 237, 237),
                Color.fromARGB(255, 212, 217, 239),
                Color.fromARGB(255, 202, 195, 241),
                Color.fromARGB(255, 177, 140, 252),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 1),
                //   child: Container(
                //     // decoration:
                //     //     BoxDecoration(color: Color.fromARGB(255, 61, 131, 189)),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.only(topLeft: Radius.zero),
                //       child: Image.asset('lib/images/zionradio.jpeg'),
                //     ),
                //   ),
                // ),
                Container(
                  child: Column(children: [
                    IconButton(
                      iconSize: 65,
                      onPressed: isPlayPressed,
                      icon: Icon(!pressed
                          ? Icons.play_circle_outline_rounded
                          : Icons.stop),
                    ),
                  ]),
                ),
                Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      color:
                          Color.fromARGB(255, 43, 43, 134), //color of divider
                      height: 5, //height spacing of divider
                      thickness: 3, //thickness of divier line
                      indent: 25, //spacing at the start of divider
                      endIndent: 25, //spacing at the end of divider
                    ),
                    Text(
                      '         ...reaching for Christ',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'AkayaTelivigala',
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  // IconButton(
  //                       color: Colors.white,
  //                       iconSize: 175,
  //                       onPressed: isPlayPressed,
  //                       icon: Icon(!pressed
  //                           ? Icons.play_circle_fill_rounded
  //                           : Icons.stop),
  //                     ),