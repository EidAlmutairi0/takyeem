import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_alert/status_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_screen.dart';

final _firestore = FirebaseFirestore.instance;

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
  String finalDate;
  String getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate.toString();
  }

  @override
  void initState() {
    doctorName = null;
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
                          "اسم الدكتور *",
                          style: textStyle,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              doctorName = value;
                            });
                          },
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
                    height: 5,
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
                            gradient: LinearGradient(
                                colors: [Colors.lightGreen, Colors.green]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          width: 150,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                if (doctorName == null || doctorName == "") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          title: Text(
                                            "الرجاء كتابة اسم الدكتور",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          actions: <Widget>[
                                            CupertinoDialogAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                isDefaultAction: true,
                                                child: Text("حسناً")),
                                          ],
                                        );
                                      });
                                } else if (comment == null || comment == "") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          title: Text(
                                            "الرجاء كتابة تعليق",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          actions: <Widget>[
                                            CupertinoDialogAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                isDefaultAction: true,
                                                child: Text("حسناً")),
                                          ],
                                        );
                                      });
                                } else {
                                  finalDate = getCurrentDate();

                                  var inss = _firestore
                                      .collection("UNis")
                                      .doc(
                                          "${currentUniversity.universityShortcut}")
                                      .collection("colleges")
                                      .doc("/${currentCollege.collegeName}")
                                      .collection("Doctors")
                                      .doc("$doctorName");
                                  var test = inss.get().then((doc) => {
                                        if (!doc.exists)
                                          {
                                            inss
                                                .set({
                                                  "Drname": doctorName,
                                                  "TotalSlider1":
                                                      FieldValue.increment(
                                                          slider1),
                                                  "TotalSlider2":
                                                      FieldValue.increment(
                                                          slider2),
                                                  "TotalSlider3":
                                                      FieldValue.increment(
                                                          slider3),
                                                  "TotalSlider4":
                                                      FieldValue.increment(
                                                          slider4),
                                                  "TotalRate":
                                                      FieldValue.increment(
                                                          (slider1 +
                                                                  slider2 +
                                                                  slider3 +
                                                                  slider4) /
                                                              4),
                                                  "numberOfRatings":
                                                      FieldValue.increment(1),
                                                })
                                                .then((value) => inss
                                                        .collection("rates")
                                                        .add({
                                                      "CureseNum":
                                                          courseShortcut,
                                                      "Slider1": slider1,
                                                      "Slider2": slider2,
                                                      "Slider3": slider3,
                                                      "Slider4": slider4,
                                                      "comment": comment,
                                                      "addingDate": finalDate,
                                                    }))
                                                .then((value) => {
                                                      _firestore
                                                          .collection(
                                                              "All Doctors")
                                                          .add({
                                                        "Dr name": doctorName,
                                                        "Dr Uni":
                                                            currentUniversity
                                                                .universityName,
                                                        "Dr Uni shortcut":
                                                            currentUniversity
                                                                .universityShortcut,
                                                        "Dr College":
                                                            currentCollege
                                                                .collegeName,
                                                        "searchKey":
                                                            doctorName[0],
                                                      })
                                                    }),
                                          }
                                        else
                                          {
                                            inss.update({
                                              "TotalSlider1":
                                                  FieldValue.increment(slider1),
                                              "TotalSlider2":
                                                  FieldValue.increment(slider2),
                                              "TotalSlider3":
                                                  FieldValue.increment(slider3),
                                              "TotalSlider4":
                                                  FieldValue.increment(slider4),
                                              "TotalRate": FieldValue.increment(
                                                  (slider1 +
                                                          slider2 +
                                                          slider3 +
                                                          slider4) /
                                                      4),
                                              "numberOfRatings":
                                                  FieldValue.increment(1),
                                            }).then((value) =>
                                                inss.collection("rates").add({
                                                  "CureseNum": courseShortcut,
                                                  "Slider1": slider1,
                                                  "Slider2": slider2,
                                                  "Slider3": slider3,
                                                  "Slider4": slider4,
                                                  "comment": comment,
                                                  "addingDate": finalDate,
                                                })),
                                          }
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
                            gradient: LinearGradient(
                                colors: [Colors.red, Color(0xFFF44336)]),
                            borderRadius: BorderRadius.circular(10),
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
