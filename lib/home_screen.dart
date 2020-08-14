import 'package:flutter/material.dart';
import 'package:takyeem/add_doctor_screen.dart';
import 'Universities.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:auto_animated/auto_animated.dart';
import 'widgets.dart';

// ignore: non_constant_identifier_names
List<Container> Unis = [];

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
        child: Unis[index],
      ),
    );

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createUniversities() {
    for (int i = Unis.length; i < Universities.universities.length; i++) {
      Unis.add(
        Container(
            width: 250,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('images/CardsBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Universities.universities[i].universityShortcut);
              },
              child: Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Universities.universities[i].universityLogo,
                    ),
                    Expanded(
                      child: Text(
                        Universities.universities[i].universityName,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.almarai(
                            textStyle: TextStyle(
                          fontSize: 12.0,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    }
  }

  @override
  void initState() {
    createUniversities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/appBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          floatingActionButton: AddDoctorFlotingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/appBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: "takyeemLogo",
                        child: Container(
                          height: 140,
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
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                        child: LiveList(
                          itemBuilder: buildAnimatedItem,
                          itemCount: Unis.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          showItemDuration: Duration(milliseconds: 500),
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
          ),
        ),
      ),
    ));
  }
}
