import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_alert/status_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takyeem/home_screen.dart';

double slider1 = 0;
double slider2 = 0;
double slider3 = 0;
double slider4 = 0;
String courseShortcut;
String comment;

final _firestore = FirebaseFirestore.instance;

TextStyle textStyle = GoogleFonts.almarai(fontSize: 18);

class AddRateScreen extends StatefulWidget {
  @override
  _AddRateScreenState createState() => _AddRateScreenState();
}

class _AddRateScreenState extends State<AddRateScreen> {
  String finalDate;
  String getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate.toString();
  }

  @override
  void initState() {
    courseShortcut = null;
    comment = null;
    slider1 = 0;
    slider2 = 0;
    slider3 = 0;
    slider4 = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
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
                          "رمز المقرر",
                          style: textStyle,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          onChanged: (String x) {
                            setState(() {
                              courseShortcut = x;
                            });
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 40,
                        child: Text("الشرح", style: textStyle),
                      ),
                      Expanded(
                        child: Container(
                          width: 220,
                          child: Slider.adaptive(
                            value: slider1,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            onChanged: (double value) {
                              setState(() {
                                slider1 = value;
                              });
                            },
                          ),
                        ),
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
                    height: 5,
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
                            child: Slider.adaptive(
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
                    height: 5,
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
                            child: Slider.adaptive(
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
                    height: 5,
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
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  rangeThumbShape: RoundRangeSliderThumbShape(
                                enabledThumbRadius: 50,
                                disabledThumbRadius: 50,
                              )),
                              child: Slider.adaptive(
                                value: slider4,
                                min: 0,
                                max: 10,
                                divisions: 10,
                                onChanged: (double value) {
                                  setState(() {
                                    slider4 = value;
                                  });
                                },
                              ),
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
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 40,
                        child: Text(
                          "التعليق *",
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
                                helperText: "هذا الحقل إجباري",
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 4,
                              onChanged: (String x) {
                                setState(() {
                                  comment = x;
                                });
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          height: 60,
                          width: 150,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                if (comment == null || comment == "") {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("الرجاء كتابة تعليق"),
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
                                } else {
                                  finalDate = getCurrentDate();
                                  _firestore
                                      .collection(
                                          "${currentUniversity.universityShortcut}")
                                      .doc(
                                          "${currentUniversity.universityShortcut}")
                                      .collection("colleges")
                                      .doc("/${currentCollege.collegeName}")
                                      .collection("Doctors")
                                      .doc("${currentDoctor.toString()}")
                                      .collection("rates")
                                      .add({
                                    "CureseNum": courseShortcut,
                                    "Slider1": slider1,
                                    "Slider2": slider2,
                                    "Slider3": slider3,
                                    "Slider4": slider4,
                                    "comment": comment,
                                    "addingDate": finalDate,
                                  });

                                  StatusAlert.show(
                                    context,
                                    duration: Duration(seconds: 1),
                                    title: 'تم اضافة التقييم',
                                    configuration:
                                        IconConfiguration(icon: Icons.done),
                                  );
                                  Future.delayed(Duration(milliseconds: 1300))
                                      .then((value) =>
                                          Navigator.of(context).pop());
                                }
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
