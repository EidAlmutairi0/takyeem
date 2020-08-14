import 'package:flutter/cupertino.dart';

import 'colleges.dart';

class University {
  int index;
  String universityShortcut;
  String universityName;
  Image universityLogo;
  List<Colleges> universityColleges;

  University(int index, String uniShortcut, String uniName, Image uniLogo,
      List<Colleges> uniColleges) {
    this.index = index;
    universityShortcut = uniShortcut;
    universityName = uniName;
    universityLogo = uniLogo;
    universityColleges = uniColleges;
  }
}
