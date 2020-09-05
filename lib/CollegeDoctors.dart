import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_doctor_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class CollegeDoctors extends StatefulWidget {
  @override
  _CollegeDoctorsState createState() => _CollegeDoctorsState();
}

class _CollegeDoctorsState extends State<CollegeDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF06567A),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDoctorScreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFb3e5fc),
        title: Text(
          currentCollege.collegeName,
          style: GoogleFonts.almarai(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
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
                    padding: const EdgeInsets.fromLTRB(80, 15, 80, 0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection("${currentUniversity.universityShortcut}")
                          .doc("${currentUniversity.universityShortcut}")
                          .collection("colleges")
                          .doc("${currentCollege.collegeName}")
                          .collection("Doctors")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final doctors = snapshot.data.docs;
                          List<Container> doctorsWidgets = [];
                          for (var doctor in doctors) {
                            var aDoctor = doctor.get("Drname");
                            final doctorWidget = Container(
                                height: 60,
                                margin: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/CardsBackground.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {
                                    setState(() {
                                      currentDoctor = doctor.get("Drname");
                                      Navigator.pushNamed(context, "DS");
                                      print(currentDoctor);
                                    });
                                  },
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 2, 0, 2),
                                            child: Image(
                                              image: AssetImage(
                                                  "images/teacher.png"),
                                            )),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            aDoctor,
                                            textDirection: TextDirection.rtl,
                                            style: GoogleFonts.almarai(
                                                textStyle: TextStyle(
                                              fontSize: 18,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                            doctorsWidgets.add(doctorWidget);
                          }
                          if (doctorsWidgets.isEmpty)
                            return Center(
                              child: Text(
                                "لا يوجد دكاتره",
                                style: GoogleFonts.almarai(
                                    textStyle: TextStyle(
                                  fontSize: 28,
                                )),
                              ),
                            );

                          return Column(
                            children: doctorsWidgets,
                          );
                        } else {
                          return Center();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
