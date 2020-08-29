import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DoctorSite.dart';
import 'home_screen.dart';

var db = FirebaseFirestore.instance;

Future getData() async {
  var snapshot = await db
      .collection("${currentUniversity.universityShortcut}")
      .doc("${currentUniversity.universityShortcut}")
      .collection("colleges")
      .doc("${currentCollege.collegeName}")
      .collection("Doctors")
      .doc("$currentDoctor")
      .get()
      .then((DocumentSnapshot) {
    getRate1 = DocumentSnapshot.get("TotalSlider1") / reatesSize;
    getRate2 = DocumentSnapshot.get("TotalSlider2") / reatesSize;
    getRate3 = DocumentSnapshot.get("TotalSlider3") / reatesSize;
    getRate4 = DocumentSnapshot.get("TotalSlider4") / reatesSize;
    totalRates = ((getRate1 + getRate2 + getRate3 + getRate4) / 4);
  });
}

double totalRates = 0;

double rate1 = 0;
double rate2 = 0;
double rate3 = 0;
double rate4 = 0;

const double scaleWidth = 200;
const double scaleHeight = 15;
const double titleFontSize = 20;
const double scaleFontSize = 12;

double getRate1 = 0;
double getRate2 = 0;
double getRate3 = 0;
double getRate4 = 0;

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

Color scaleColor(double num) {
  if (num >= 8)
    return Color(0xFF59AE51);
  else if (num >= 6 && num < 8)
    return Color(0xFFB1CD4C);
  else if (num >= 4 && num < 6)
    return Color(0xFFFBC634);
  else if (num >= 2 && num < 4)
    return Color(0xFFF3944F);
  else
    return Color(0xFFEB5846);
}

class _SlidersState extends State<Sliders> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _animation1;
  Animation _animation2;
  Animation _animation3;

  Animation _curve;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animation = Tween(begin: 0.0 * 20, end: getRate1 * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate1 = (_animation.value / 20);
        });
      });
    _animation1 = Tween(begin: 0.0 * 20, end: getRate2 * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate2 = (_animation1.value / 20);
        });
      });
    _animation2 = Tween(begin: 0.0 * 20, end: getRate3 * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate3 = (_animation2.value / 20);
        });
      });
    _animation3 = Tween(begin: 0.0 * 20, end: getRate4 * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate4 = (_animation3.value / 20);
        });
      });
    getData().then((value) => _animationController.forward());

    super.initState();
  }

  @override
  void deactivate() {
    _animationController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    "الشرح",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: scaleWidth,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        width: _animation.value,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: scaleColor(getRate1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "${(rate1 * 10).toInt()}%",
                            style: TextStyle(
                                fontSize: scaleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    "التعامل",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: scaleWidth,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        width: _animation1.value,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: scaleColor(getRate2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "${(rate2 * 10).toInt()}%",
                            style: TextStyle(
                                fontSize: scaleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    "التحضير",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: scaleWidth,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        width: _animation2.value,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: scaleColor(getRate3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "${(rate3 * 10).toInt()}%",
                            style: TextStyle(
                                fontSize: scaleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Text(
                    "الدرجات",
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        fontSize: titleFontSize,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: scaleWidth,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Container(
                        width: _animation3.value,
                        height: scaleHeight,
                        decoration: BoxDecoration(
                          color: scaleColor(getRate4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "${(rate4 * 10).toInt()}%",
                            style: TextStyle(
                                fontSize: scaleFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
