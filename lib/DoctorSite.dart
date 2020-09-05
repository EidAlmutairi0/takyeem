import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takyeem/home_screen.dart';
import 'Sliders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_rate_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorSite extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF06567A),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddRateScreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        title: Text(
          ("${currentUniversity.universityName}" +
              "  -  " +
              "${currentCollege.collegeName}"),
          style: GoogleFonts.almarai(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFb3e5fc),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/appBackground.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    StreamBuilder<DocumentSnapshot>(
                      stream: _firestore
                          .collection("${currentUniversity.universityShortcut}")
                          .doc("${currentUniversity.universityShortcut}")
                          .collection("colleges")
                          .doc("${currentCollege.collegeName}")
                          .collection("Doctors")
                          .doc("$currentDoctor")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final aDoctor = snapshot.data;

                          reatesSize = aDoctor.get("numberOfRatings");
                          totalRates = aDoctor.get("TotalRate") / reatesSize;
                          getRate1 = aDoctor.get("TotalSlider1") / reatesSize;
                          getRate2 = aDoctor.get("TotalSlider2") / reatesSize;
                          getRate3 = aDoctor.get("TotalSlider3") / reatesSize;
                          getRate4 = aDoctor.get("TotalSlider4") / reatesSize;

                          return Sliders();
                        } else {
                          return Center();
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection("${currentUniversity.universityShortcut}")
                          .doc("${currentUniversity.universityShortcut}")
                          .collection("colleges")
                          .doc("${currentCollege.collegeName}")
                          .collection("Doctors")
                          .doc("$currentDoctor")
                          .collection("rates")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final ratings = snapshot.data.docs;
                          List<RateWidget> ratingsWidgets = [];
                          for (var aRate in ratings) {
                            var curesNum = aRate.get("CureseNum");
                            final comment = aRate.get("comment");
                            final date = aRate.get("addingDate");

                            curesNum == null
                                ? curesNum = ""
                                : curesNum = curesNum;
                            final ratingWidget = RateWidget(
                              curseNum: curesNum,
                              comment: comment,
                              date: date,
                            );
                            ratingsWidgets.add(ratingWidget);
                          }
                          return Column(
                            children: ratingsWidgets,
                          );
                        } else {
                          return Center();
                        }
                      },
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RateWidget extends StatefulWidget {
  String curseNum;
  String comment;
  String date;

  RateWidget({this.curseNum, this.comment, this.date});

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  void displayDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(
                "هل انت متأكد من انك تريد الابلاغ؟",
                style: TextStyle(fontSize: 16),
              ),
              content:
                  Text("يكون الإبلاغ على التعليقات التي تحمل إساءة مباشرة"),
              actions: <Widget>[
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("تأكيد")),
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    child: Text("تراجع")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
            child: Row(
              children: [
                Text(
                  "المقرر : ",
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.curseNum,
                  style: GoogleFonts.almarai(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.comment,
              style: GoogleFonts.almarai(
                textStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.date,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              IconButton(
                iconSize: 25,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(5),
                onPressed: displayDialog,
                icon: Icon(Icons.error_outline),
                tooltip: "إبلاغ",
              ),
            ],
          )
        ],
      ),
    );
  }
}
