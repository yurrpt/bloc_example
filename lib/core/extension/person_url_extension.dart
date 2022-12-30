import '../enum/person_enum.dart';

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons:
        return 'http://127.0.0.1:5500/api/persons.json';
      case PersonUrl.persons2:
        return 'http://127.0.0.1:5500/api/persons2.json';
    }
  }
}
