import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Universities.dart';

void main() {
  runApp(MyApp());
}

Universities uni = Universities();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  List<Container> Unis = [];
  void createUniversities() {
    for (int i = Unis.length; i < uni.universities.length; i++) {
      Unis.add(
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('images/CardsBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.fromLTRB(60, 5, 60, 0),
            child: FlatButton(
              onPressed: () {
                var uniName = uni.universities[i].universityName;
                print(uniName);
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

  Widget build(BuildContext context) {
    createUniversities();
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

      home: Scaffold(
          backgroundColor: Colors.blueGrey[200],
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/appBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 140,
                          child: Image(
                            image: AssetImage('images/Takyeem logo.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 25.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 20),
                              cursorRadius: Radius.circular(10),
                              maxLines: 1,
                              cursorWidth: 2,
                              decoration: InputDecoration(
                                labelText: "A اسم الدكتور",
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
                        Column(
                          children: Unis,
                        ),
                        Container(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
