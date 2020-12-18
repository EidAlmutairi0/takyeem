import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Universities.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:takyeem/add_doctor_screen.dart';
import 'home_screen.dart';

List<Container> colleges;
List<Row> listOfColumns;

Widget buildButtomSheet(BuildContext context) => AddDoctorScreen();

class IMUCollegesPage extends StatefulWidget {
  @override
  _IMUCollegesPageState createState() => _IMUCollegesPageState();
}

class _IMUCollegesPageState extends State<IMUCollegesPage> {
  @override
  void initState() {
    setState(() {});
    getColleges(2, context);
    super.initState();
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        alwaysIncludeSemantics: true,
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: colleges[index],
        ),
      );

  List<Container> getColleges(int uniNum, BuildContext context) {
    colleges = [];
    for (int i = colleges.length;
        i < Universities.universities[uniNum].universityColleges.length;
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                currentCollege =
                    Universities.universities[uniNum].universityColleges[i];
                print(
                  currentUniversity.universityName +
                      " - " +
                      currentCollege.collegeName,
                );
                Navigator.pushNamed(context, "CD");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Universities
                      .universities[uniNum].universityColleges[i].collegeLogo,
                  Text(
                    Universities
                        .universities[uniNum].universityColleges[i].collegeName,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color(0xFFb3e5fc),
          title: Text(
            "جامعة الإمام محمد بن سعود",
            style: GoogleFonts.almarai(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
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
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "takyeemLogo",
                      child: Container(
                        height: 0,
                        child: Image(
                          image: AssetImage('images/Takyeem logo.png'),
                        ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: LiveGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        itemBuilder: buildAnimatedItem,
                        itemCount: colleges.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        reAnimateOnVisibility: true,
                        showItemDuration: Duration(milliseconds: 350),
                        showItemInterval: Duration(milliseconds: 350),
                        delay: Duration(seconds: 0),
                        controller: ScrollController(),
                      ),
                    ),
                    SizedBox(
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
