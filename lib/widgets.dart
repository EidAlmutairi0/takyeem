import 'package:flutter/material.dart';
import 'add_doctor_screen.dart';
import 'add_rate_screen.dart';

class AddDoctorFlotingActionButton extends StatefulWidget {
  @override
  _AddDoctorFlotingActionButtonState createState() =>
      _AddDoctorFlotingActionButtonState();
}

class _AddDoctorFlotingActionButtonState
    extends State<AddDoctorFlotingActionButton> {
  Widget buildAddDoctorButtomSheet(BuildContext context) => AddDoctorScreen();
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return show
        ? FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF06567A),
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context, builder: buildAddDoctorButtomSheet);
              showFAB(false);
              sheetController.closed.then((value) => showFAB(true));
            },
          )
        : Container();
  }

  void showFAB(bool value) {
    setState(() {
      show = value;
    });
  }
}

class AddRateFlotingActionButton extends StatefulWidget {
  @override
  _AddRateFlotingActionButtonState createState() =>
      _AddRateFlotingActionButtonState();
}

class _AddRateFlotingActionButtonState
    extends State<AddRateFlotingActionButton> {
  Widget buildAddRateButtomSheet(BuildContext context) => AddRateScreen();
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return show
        ? FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF06567A),
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context, builder: buildAddRateButtomSheet);
              showFAB(false);
              sheetController.closed.then((value) => showFAB(true));
            },
          )
        : Container();
  }

  void showFAB(bool value) {
    setState(() {
      show = value;
    });
  }
}
