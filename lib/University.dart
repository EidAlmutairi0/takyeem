import 'package:flutter/cupertino.dart';

import 'colleges.dart';

class University {
  String universityName;
  Image universityLogo;
  List<Colleges> universityColleges;

  University(String uniName, Image uniLogo, List<Colleges> uniColleges) {
    universityName = uniName;
    universityLogo = uniLogo;
    universityColleges = uniColleges;
  }
}
