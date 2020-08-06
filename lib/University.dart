import 'package:flutter/cupertino.dart';

import 'colleges.dart';

class University {
  String universityShortcut;
  String universityName;
  Image universityLogo;
  List<Colleges> universityColleges;

  University(String uniShortcut, String uniName, Image uniLogo,
      List<Colleges> uniColleges) {
    universityShortcut = uniShortcut;
    universityName = uniName;
    universityLogo = uniLogo;
    universityColleges = uniColleges;
  }
}
