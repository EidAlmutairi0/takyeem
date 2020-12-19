import 'package:algolia/algolia.dart';

class AlgoliaApplication {
  static final Algolia algolia = Algolia.init(
    applicationId: 'VIRWXF3IZO', //ApplicationID
    apiKey:
        '4380e2f8e63cd6039725cf18712aa04f', //search-only api key in flutter code
  );
}
