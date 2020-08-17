import 'package:flutter/material.dart';
import 'Sliders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_rate_screen.dart';

class DoctorSite extends StatefulWidget {
  @override
  _DoctorSiteState createState() => _DoctorSiteState();
}

class _DoctorSiteState extends State<DoctorSite> {
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "احمد الصادق",
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ),
                          Sliders()
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Center(
                        child: Text("شرحه سيء"),
                      ),
                    ),
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
