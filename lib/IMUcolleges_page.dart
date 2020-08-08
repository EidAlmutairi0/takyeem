import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'get_colleges.dart';

class IMUCollegesPage extends StatefulWidget {
  @override
  _IMUCollegesPageState createState() => _IMUCollegesPageState();
}

class _IMUCollegesPageState extends State<IMUCollegesPage> {
  @override
  Widget build(BuildContext context) {
    getColleges(2);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color(0xFFb3e5fc),
          title: Text(
            "جامعة الملك سعود",
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
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
                      SizedBox(
                        height: 10,
                      ),
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
                      Column(
                        children: listOfColumns,
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
        ));
  }
}
