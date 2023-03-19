import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/user.dart';

class TimKiemController extends GetxController {
  final Rx<List<User>> timkiemUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => timkiemUsers.value;

  searchUser(String typedUser) async {
    timkiemUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> retVal = [];
      for (var elem in query.docs) {
        retVal.add(User.fromSnap(elem));
      }
      return retVal;
    }));
  }
}