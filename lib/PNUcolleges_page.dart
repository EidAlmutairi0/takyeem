import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'get_colleges.dart';

class PNUCollegesPage extends StatefulWidget {
  @override
  _PNUCollegesPageState createState() => _PNUCollegesPageState();
}

class _PNUCollegesPageState extends State<PNUCollegesPage> {
  @override
  Widget build(BuildContext context) {
    getColleges(1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "جامعة الأميرة نورة",
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: Colors.white,
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
            child: Container(
              child: SingleChildScrollView(
                child: Column(
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
        ));
  }
}