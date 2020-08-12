import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Universities.dart';
import 'KSUcolleges_page.dart';
import 'IMUcolleges_page.dart';
import 'PNUcolleges_page.dart';
import 'KSAUcolleges_page.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

Universities uni = Universities();
List<Container> Unis = [];
Icon heart = Icon(
  EvaIcons.heart,
  color: Colors.white,
);
String welcomeText = "Made with $heart from a KSU student";

Widget buildAnimatedItem(
  BuildContext context,
  int index,
  Animation<double> animation,
) =>
    // For example wrap with fade transition
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: Unis[index],
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
      routes: {
        "KSU": (context) => KSUCollegesPage(),
        "IMU": (context) => IMUCollegesPage(),
        "PNU": (context) => PNUCollegesPage(),
        "KSAU": (context) => KSAUCollegesPage(),
      },
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void createUniversities() {
    for (int i = Unis.length; i < uni.universities.length; i++) {
      Unis.add(
        Container(
            width: 250,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('images/CardsBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, uni.universities[i].universityShortcut);
              },
              child: Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: uni.universities[i].universityLogo,
                    ),
                    Expanded(
                      child: Text(
                        uni.universities[i].universityName,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                          fontSize: 12.0,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    }
  }

  @override
  void initState() {
    createUniversities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/appBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Hero(
                    tag: "takyeemLogo",
                    child: Container(
                      height: 140,
                      child: Image(
                        image: AssetImage('images/Takyeem logo.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        cursorRadius: Radius.circular(10),
                        maxLines: 1,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          labelText: "اسم الدكتور",
                          labelStyle: TextStyle(),
                          icon: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: LiveList(
                      itemBuilder: buildAnimatedItem,
                      itemCount: Unis.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      showItemDuration: Duration(milliseconds: 500),
                      showItemInterval: Duration(milliseconds: 350),
                      delay: Duration(seconds: 0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
