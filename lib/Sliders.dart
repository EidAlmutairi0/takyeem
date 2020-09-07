import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

double rate1 = 0;
double rate2 = 0;
double rate3 = 0;
double rate4 = 0;
double totalRates = 0;

const double scaleWidth = 200;
const double scaleHeight = 15;
const double titleFontSize = 20;
const double scaleFontSize = 12;

double getRate1 = 0;
double getRate2 = 0;
double getRate3 = 0;
double getRate4 = 0;
double getTotalRates = 0;

int reatesSize = 0;

Color scaleColor(double num) {
  if (num >= 9)
    return Color(0xFF05FF01);
  else if (num >= 8 && num < 9)
    return Color(0xFF30F001);
  else if (num >= 7 && num < 8)
    return Color(0xFF64F500);
  else if (num >= 6 && num < 7)
    return Color(0xFF99FE00);
  else if (num >= 5 && num < 6)
    return Color(0xFFCCFF00);
  else if (num >= 4 && num < 5)
    return Color(0xFFF9FC00);
  else if (num >= 3 && num < 4)
    return Color(0xFFFCCA00);
  else if (num >= 2 && num < 3)
    return Color(0xFFFF9A01);
  else if (num >= 1 && num < 2)
    return Color(0xFFFE6701);
  else
    return Color(0xFFFF3301);
}

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _animation1;
  Animation _animation2;
  Animation _animation3;
  Animation _animation4;

  Animation _curve;

  @override
  void initState() {
    totalRates = getTotalRates;
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
    _animation4 = Tween(begin: 0.0, end: getTotalRates).animate(_curve)
      ..addListener(() {
        setState(() {
          totalRates = (_animation3.value / 20);
        });
      });
    _animationController.forward();

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
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentDoctor,
                    style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 60,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: scaleColor(totalRates)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${totalRates.toStringAsFixed(1)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Divider(),
                        Text(
                          "10.0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
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
                                  color: scaleColor(rate1),
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
                                  color: scaleColor(rate2),
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
                                  color: scaleColor(rate3),
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
                                  color: scaleColor(rate4),
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
            ],
          ),
        ),
      ),
    );
  }
}
