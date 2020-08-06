import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Universities.dart';

Universities uni;
List<Container> colleges;
List<Row> listOfColumns;

void getColleges(int uniNum) {
  uni = Universities();
  colleges = [];
  listOfColumns = [];
  for (int i = colleges.length;
      i < uni.universities[uniNum].universityColleges.length;
      i++) {
    colleges.add(
      Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
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
  colleges = colleges.reversed.toList();
  double s = uni.universities[uniNum].universityColleges.length / 3;
  if (listOfColumns.length != s.ceil()) {
    for (int i = 0; i < s.ceil(); i++) {
      if (colleges.length >= 3) {
        listOfColumns.add(Row(
          children: [
            colleges[colleges.length - 1],
            colleges[colleges.length - 2],
            colleges[colleges.length - 3]
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
        colleges.length = colleges.length - 3;
      } else if (colleges.length == 2) {
        listOfColumns.add(Row(
          children: [
            colleges[colleges.length - 1],
            colleges[colleges.length - 2]
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
        colleges.length = colleges.length - 2;
      } else {
        listOfColumns.add(Row(
          children: [colleges[colleges.length - 1]],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
        colleges.length--;
      }
    }
  }
}
