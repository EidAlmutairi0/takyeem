import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'Universities.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:auto_animated/auto_animated.dart';
import 'University.dart';
import 'colleges.dart';
import 'Algolia_Application.dart';

// ignore: non_constant_identifier_names
List<Container> Unis = [];
var queryResultSet = [];
var tempSearchStore = [];
University currentUniversity;
Colleges currentCollege;
String currentDoctor;
String currentUniversityNameInSearch;
String currentUniversityInSearch;
String currentCollegeInSearch;
String currentDoctorInSearch;

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

  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm;

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("Doctors").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  List list = [];

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
                    TextFormField(
                        onChanged: (val) {
                          setState(() {
                            _searchTerm = val;
                          });
                        },
                        style: new TextStyle(color: Colors.black, fontSize: 20),
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search ...',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black))),
                    StreamBuilder<List<AlgoliaObjectSnapshot>>(
                      stream: Stream.fromFuture(_operation(_searchTerm)),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text(
                            "Start Typing",
                            style: TextStyle(color: Colors.black),
                          );
                        else {
                          List<AlgoliaObjectSnapshot> currSearchStuff =
                              snapshot.data;

                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container();
                            default:
                              if (snapshot.hasError)
                                return new Text('Error: ${snapshot.error}');
                              else
                                return CustomScrollView(
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          if (_searchTerm.length > 0) {
                                            var aDoc = currSearchStuff[index]
                                                .data
                                                .values
                                                .toList();

                                            return (DisplaySearchResult(
                                              DocName: aDoc[3],
                                              DocCollege: aDoc[0],
                                              DocUni: aDoc[1],
                                              DocUniShortcut: aDoc[2],
                                            ));
                                          } else {
                                            return Container();
                                          }
                                        },
                                        childCount: currSearchStuff.length ?? 0,
                                      ),
                                    ),
                                  ],
                                );
                          }
                        }
                      },
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

class DisplaySearchResult extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String DocName;
  // ignore: non_constant_identifier_names
  final String DocCollege;
  // ignore: non_constant_identifier_names
  final String DocUni;
  // ignore: non_constant_identifier_names
  final String DocUniShortcut;

  DisplaySearchResult(
      {Key key,
      // ignore: non_constant_identifier_names
      this.DocCollege,
      // ignore: non_constant_identifier_names
      this.DocName,
      // ignore: non_constant_identifier_names
      this.DocUni,
      // ignore: non_constant_identifier_names
      this.DocUniShortcut})
      : super(key: key);

  @override
  _DisplaySearchResultState createState() => _DisplaySearchResultState();
}

class _DisplaySearchResultState extends State<DisplaySearchResult> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          currentUniversityNameInSearch = widget.DocUni;
          currentUniversityInSearch = widget.DocUniShortcut;
          currentCollegeInSearch = widget.DocCollege;
          currentDoctorInSearch = widget.DocName;
        });
        Navigator.pushNamed(context, "DSNS");
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.DocName,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              widget.DocCollege,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              widget.DocUni,
              style: TextStyle(color: Colors.black),
            ),
            Divider(
              color: Colors.black,
            ),
          ]),
    );
  }
}
