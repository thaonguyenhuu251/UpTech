import 'package:firebase_database/firebase_database.dart';

class NewsDao {
  final DatabaseReference _newsRef =
  FirebaseDatabase.instance.ref().child('News');

  Query getMessageQuery() {
    return _newsRef;
  }

}
