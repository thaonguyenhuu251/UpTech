import 'package:firebase_database/firebase_database.dart';
class CourseDao {
  final DatabaseReference _courseRef =
  FirebaseDatabase.instance.ref().child('Course');

  Query getMessageQuery() {
    return _courseRef;
  }

}
