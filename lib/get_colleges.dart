import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Universities.dart';

Universities uni;
List<Container> colleges;
List<Row> listOfColumns;

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
        child: colleges[index],
      ),
    );

List<Container> getColleges(int uniNum) {
  uni = Universities();
  colleges = [];
  for (int i = colleges.length;
      i < uni.universities[uniNum].universityColleges.length;
      i++) {
    colleges.add(
      Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage('images/CardsBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: FlatButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                uni.universities[uniNum].universityColleges[i].collegeLogo,
                Text(
                  uni.universities[uniNum].universityColleges[i].collegeName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                      textStyle: TextStyle(
                    fontSize: 9,
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
  return colleges;
}
