import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double scaleWidth = 200;
const double scaleHeight = 15;
const double titleFontSize = 20;
const double scaleFontSize = 12;

double rate = 0;
double rate1 = 0;
double rate2 = 0;
double rate3 = 0;

class Sliders extends StatefulWidget {
  static double rangeTotal = (rate + rate1 + rate2 + rate3) / 4;

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
  List<int> rates = [10, 8, 10, 10, 10, 10, 10, 8, 8, 6, 8];
  List<int> rates1 = [8, 5, 7, 5, 4, 5, 8, 2, 6, 4, 5];
  List<int> rates2 = [6, 9, 6, 9, 8, 7, 10, 8, 8, 6, 7];
  List<int> rates3 = [5, 0, 7, 0, 4, 9, 0, 1, 2, 5, 4];

  AnimationController _animationController;
  Animation _animation;
  Animation _animation1;
  Animation _animation2;
  Animation _animation3;

  Animation _curve;

  double getRange() {
    double sum = 0;
    if (rates.length != 0) {
      rates.forEach((e) => sum += e);
      sum = sum / rates.length;
    }
    return sum;
  }

  double getRange1() {
    double sum = 0;
    if (rates1.length != 0) {
      rates1.forEach((e) => sum += e);
      sum = sum / rates1.length;
    }
    return sum;
  }

  double getRange2() {
    double sum = 0;
    if (rates2.length != 0) {
      rates2.forEach((e) => sum += e);
      sum = sum / rates2.length;
    }
    return sum;
  }

  double getRange3() {
    double sum = 0;
    if (rates3.length != 0) {
      rates3.forEach((e) => sum += e);
      sum = sum / rates3.length;
    }
    return sum;
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );
    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animation = Tween(begin: 0.0 * 20, end: getRange() * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate = (_animation.value / 20);
        });
      });
    _animation1 = Tween(begin: 0.0 * 20, end: getRange1() * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate1 = (_animation1.value / 20);
        });
      });
    _animation2 = Tween(begin: 0.0 * 20, end: getRange2() * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate2 = (_animation2.value / 20);
        });
      });
    _animation3 = Tween(begin: 0.0 * 20, end: getRange3() * 20).animate(_curve)
      ..addListener(() {
        setState(() {
          rate3 = (_animation3.value / 20);
        });
      });
    _animationController.forward();

    getRange();

    super.initState();
  }

  @override
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
                          color: scaleColor(getRange()),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "${(rate * 10).toInt()}%",
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
                          color: scaleColor(getRange1()),
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
                          color: scaleColor(getRange2()),
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
                          color: scaleColor(getRange3()),
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
          ],
        ),
      ),
    );
  }
}
