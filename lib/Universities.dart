import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takyeem/colleges.dart';
import 'University.dart';

class Universities {
  List<University> universities = [
    // جامعة الملك سعود
    // عدد الكليات: 13
    University(
      "KSU",
      "جامعة الملك سعود",
      Image.asset("images/Ksu.png"),
      [
        Colleges("الكليات الصحية",
            Image.asset("images/Colleges logos/الكليات الصحية.png")),
        Colleges("كلية الهندسة",
            Image.asset("images/Colleges logos/كلية الهندسة.png")),
        Colleges("كلية علوم الحاسب والمعلومات",
            Image.asset("images/Colleges logos/كلية الحاسب.png")),
        Colleges("كلية علوم الأغذية والزراعة",
            Image.asset("images/Colleges logos/كلية الزراعة.png")),
        Colleges("كلية العلوم",
            Image.asset("images/Colleges logos/كلية العلوم.png")),
        Colleges("كلية العمارة والتخطيط",
            Image.asset("images/Colleges logos/كلية العمارة.png")),
        Colleges("كلية إدارة الأعمال",
            Image.asset("images/Colleges logos/كلية الادارة.png")),
        Colleges("كلية الحقوق والعلوم السياسية",
            Image.asset("images/Colleges logos/كلية الحقوق.png")),
        Colleges("كلية اللغات والترجمة",
            Image.asset("images/Colleges logos/كلية اللغات.png")),
        Colleges("كلية الآداب",
            Image.asset("images/Colleges logos/كلية الاداب.png")),
        Colleges("كلية الرياضة والنشاط البدني",
            Image.asset("images/Colleges logos/كلية البدنية.png")),
        Colleges("كلية التربية",
            Image.asset("images/Colleges logos/كلية التربية.png")),
        Colleges("كلية السياحة والآثار",
            Image.asset("images/Colleges logos/كلية السياحة.png")),
      ],
    ),
    // جامعة الاميره نوره
    // عدد الكليات: 10
    University(
      "PNU",
      "جامعة الأميرة نورة",
      Image.asset("images/PNU.png"),
      [
        Colleges("الكليات الصحية",
            Image.asset("images/Colleges logos/الكليات الصحية.png")),
        Colleges("كلية علوم الحاسب والمعلومات",
            Image.asset("images/Colleges logos/كلية الحاسب.png")),
        Colleges("كلية إدارة الأعمال",
            Image.asset("images/Colleges logos/كلية الادارة.png")),
        Colleges("كلية اللغات والترجمة",
            Image.asset("images/Colleges logos/كلية اللغات.png")),
        Colleges("كلية الهندسة",
            Image.asset("images/Colleges logos/كلية الهندسة.png")),
        Colleges("كلية العلوم",
            Image.asset("images/Colleges logos/كلية العلوم.png")),
        Colleges("كلية الخدمة الاجتماعية",
            Image.asset("images/Colleges logos/كلية الخدمة الاجتماعية.png")),
        Colleges("كلية الآداب",
            Image.asset("images/Colleges logos/كلية الاداب.png")),
        Colleges("كلية التربية",
            Image.asset("images/Colleges logos/كلية التربية.png")),
        Colleges("كلية التصاميم والفنون",
            Image.asset("images/Colleges logos/كلية الفنون.png")),
      ],
    ),
    // جامعة الإمام
    // عدد الكليات: 11
    University(
      "IMU",
      "جامعة الإمام محمد بن سعود",
      Image.asset("images/IMU.png"),
      [
        Colleges("الكليات الصحية",
            Image.asset("images/Colleges logos/الكليات الصحية.png")),
        Colleges("كلية العلوم",
            Image.asset("images/Colleges logos/كلية العلوم.png")),
        Colleges("كلية الهندسة",
            Image.asset("images/Colleges logos/كلية الهندسة.png")),
        Colleges("كلية الاقتصاد والعلوم الادارية",
            Image.asset("images/Colleges logos/كلية الادارة.png")),
        Colleges("كلية علوم الحاسب والمعلومات",
            Image.asset("images/Colleges logos/كلية الحاسب.png")),
        Colleges("كلية اللغة العربية",
            Image.asset("images/Colleges logos/كلية اللغة العربية.png")),
        Colleges("كلية اللغات والترجمة",
            Image.asset("images/Colleges logos/كلية اللغات.png")),
        Colleges("كلية الإعلام والاتصال",
            Image.asset("images/Colleges logos/كلية الاعلام.png")),
        Colleges("كلية الشريعة",
            Image.asset("images/Colleges logos/كلية الحقوق.png")),
        Colleges("كلية أصول الدين",
            Image.asset("images/Colleges logos/كلية التربية.png")),
        Colleges("كلية العلوم الاجتماعية",
            Image.asset("images/Colleges logos/كلية الخدمة الاجتماعية.png")),
      ],
    ),
    // جامعة الحرس
    // عدد الكليات: 1
    University(
      "KSAU",
      "جامعة الملك سعود للعلوم الصحية",
      Image.asset("images/Ksau.png"),
      [
        Colleges("الكليات الصحية",
            Image.asset("images/Colleges logos/الكليات الصحية.png")),
      ],
    ),
    // جامعة الحرس
    // عدد الكليات: 1
  ];
}
