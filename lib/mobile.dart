// import 'package:audioplayers/notifications.dart';
import 'package:zionwebradio/lottiescreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mobile extends StatefulWidget {
  Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
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
      // int res = await audioPlayer.play(url);
      print('playing');
    } else {
      // int ress = await audioPlayer.stop();
      print('stoped');
    }

    setState(
      () {
        if (pressed == true) {
          pressed = false;
          print('pressed');
        } else {
          pressed = true;
          print('norpressed');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            children: [
              Container(
                child: Text('ZW'),
              ),
              Container(
                child: Text(
                  ' Radio',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'AkayaTelivigala'),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Zion-Way Radio"),
              accountEmail: Text("Connect with us"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "ZR",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook,
                  color: Colors.blue, size: 30),
              title: const Text(
                'Facebook',
              ),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.facebook.com/Zionwayradio-109645215221435/');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram,
                  color: Colors.red, size: 30),
              title: const Text(
                'Instagram',
              ),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://instagram.com/zionwayradio?igshid=YmMyMTA2M2Y=');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.twitter,
                  color: Colors.blue, size: 30),
              title: const Text(
                'Twitter',
              ),
              // image: Image.asset('lib/icons/facebook.png'),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://twitter.com/zionwayradio?t=HiJ7uMYuSSHPnYn7PPEnSg&s=09');

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        left: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                // decoration:
                //     BoxDecoration(color: Color.fromARGB(255, 61, 131, 189)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset('lib/images/zionradio.jpeg'),
                ),
              ),
            ),
            Container(
              child: Expanded(
                  child: SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.4, 0.7, 0.9],
                      colors: [
                        Color(0xFF3594DD),
                        Color(0xFF4563DB),
                        Color(0xFF5036D5),
                        Color(0xFF5816DB),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'ZionWay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w100),
                          ),
                          Text(
                            '...reaching for Christ',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.white,
                                fontFamily: 'AkayaTelivigala',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'on air',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.shuffle,
                            color: Colors.white,
                          ),
                          // Icon(
                          //   Icons.repeat,
                          //   color: Colors.white,
                          // ),
                          LottieScreen(),
                          Text(
                            "00:00",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.white,
                        iconSize: 60,
                        onPressed: isPlayPressed,
                        icon: Icon(!pressed
                            ? Icons.play_circle_fill_rounded
                            : Icons.stop),
                      )
                    ],
                  ),
                  // color: Colors.deepPurple,
                ),
                width: double.infinity,
              )),
            )
          ],
        ),
      ),
    );
  }
}
