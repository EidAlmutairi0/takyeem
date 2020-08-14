import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Universities.dart';
import 'University.dart';
import 'colleges.dart';
import 'widgets.dart';

double slider1 = 0;
double slider2 = 0;
double slider3 = 0;
double slider4 = 0;
String doctorName;
String courseShortcut;
String comment;

TextStyle textStyle = GoogleFonts.almarai(fontSize: 18);

class AddDoctorScreen extends StatefulWidget {
  @override
  _AddDoctorScreenState createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0D3F4F5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        height: 625,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 30, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "اسم الدكتور *",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 18, height: 1),
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          helperText: "هذا الحقل إجباري",
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                        maxLength: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "رمز المقرر",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        onChanged: (String x) {
                          courseShortcut = x;
                        },
                        style: TextStyle(fontSize: 18, height: 1),
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                        maxLength: 10,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text("الشرح", style: textStyle),
                    ),
                    Expanded(
                      child: Container(
                          width: 220,
                          child: Slider(
                            value: slider1,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            onChanged: (double value) {
                              setState(() {
                                slider1 = value;
                              });
                            },
                          )),
                    ),
                    Text(
                      "${slider1.toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "التعامل",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 220,
                          child: Slider(
                            value: slider2,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            onChanged: (double value) {
                              setState(() {
                                slider2 = value;
                              });
                            },
                          )),
                    ),
                    Text(
                      "${slider2.toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "التحضير",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 220,
                          child: Slider(
                            value: slider3,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            onChanged: (double value) {
                              setState(() {
                                slider3 = value;
                              });
                            },
                          )),
                    ),
                    Text(
                      "${slider3.toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "الدرجات",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 220,
                          child: Slider(
                            value: slider4,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            onChanged: (double value) {
                              setState(() {
                                slider4 = value;
                              });
                            },
                          )),
                    ),
                    Text(
                      "${slider4.toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 40,
                      child: Text(
                        "التعليق",
                        style: textStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 220,
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 18, height: 1),
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 4,
                            onChanged: (String x) {
                              comment = x;
                            },
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      height: 60,
                      width: 150,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (doctorName == null || doctorName == "") {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("الرجاء كتابةاسم الدكتور"),
                                        content: Text("حقل اسم الدكتور حقل"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              });
                            } else {}
                          });
                        },
                        child: Text(
                          "اضافة تقييم",
                          style: textStyle.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      height: 60,
                      width: 150,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "الغاء",
                          style: textStyle.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
