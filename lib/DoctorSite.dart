import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Sliders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_rate_screen.dart';

double totalRates;

class DoctorSite extends StatefulWidget {
  @override
  _DoctorSiteState createState() => _DoctorSiteState();
}

class _DoctorSiteState extends State<DoctorSite> {
  @override
  void initState() {
    totalRates = ((rate + rate1 + rate2 + rate3) / 4);
    super.initState();
  }

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
                                  "احمد الصادق",
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
                                      border: Border.all(
                                          color: scaleColor(totalRates)),
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
                                        "10",
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
                            Sliders(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ريض 106"),
                          Text(
                              "شرحه سي ايبايةباحخياةي يئاحةيئبائينخاةحئاةح ئيبالةيئبائنيمبةائيحبن ةحيئبانةيئبحخاةي جحةيائباةئياخياةئيحابئةياخيئا ةحئيباةيباخةء"),
                        ],
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
