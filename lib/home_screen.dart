import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Universities.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:auto_animated/auto_animated.dart';
import 'University.dart';
import 'colleges.dart';
import 'package:getwidget/getwidget.dart';

// ignore: non_constant_identifier_names
List<Container> Unis = [];
var queryResultSet = [];
var tempSearchStore = [];
University currentUniversity;
Colleges currentCollege;
String currentDoctor;

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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                setState(() {
                  currentUniversity = Universities.universities[i];
                });
                print(currentUniversity.universityName);
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

  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

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
        child: Container(
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
                      child: GFSearchBar(
                        searchList: list,
                        searchQueryBuilder: (query, list) {
                          return list
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        },
                        overlaySearchListItemBuilder: (item) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        },
                        onItemSelected: (item) {
                          setState(() {
                            print('$item');
                          });
                        },
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
    ));
  }
}
