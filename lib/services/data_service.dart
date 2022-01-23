import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  late DocumentSnapshot _documentSnapshot;
  DatabaseService({required this.uid});

  Future<void> savePhone(String number) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(this.uid)
        .set({'phone number': number});
  }

  Future<String> getPhone() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(this.uid)
        .get()
        .then((value) => _documentSnapshot = value);

    var phoneNumber = _documentSnapshot['phone number'];
    print(phoneNumber);
    return phoneNumber;
  }
}
