import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoupanProvider with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mobilecontroler = TextEditingController();
  final TextEditingController notecontroller = TextEditingController();
  final TextEditingController discountcontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();
  final TextEditingController leedcontroller = TextEditingController();
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('Coupan').snapshots();
  String docId = '';
  String mobileErrorText = '';
  String dateErrorText = '';
  String noteErrorText = '';
  String discountErrorText = '';
  List<String> list = <String>['student', 'vendor'];

  void insertData() async {
    CollectionReference intern =
        FirebaseFirestore.instance.collection('Coupan');
    intern.add({
      'name': namecontroller.text,
      'mobile': int.parse(mobilecontroler.text),
      'discount': int.parse(discountcontroller.text),
      'dob': dobcontroller.text,
      'type': typecontroller.text,
      'leed': int.parse(leedcontroller.text),
      'note': notecontroller.text
    });

    namecontroller.text = '';
    mobilecontroler.text = '';
    discountcontroller.text = '';
    dobcontroller.text = '';
    typecontroller.text = '';
    leedcontroller.text = '';
    notecontroller.text = '';
    notifyListeners();
  }

  Future<void> updateData(String id) async {
    FirebaseFirestore.instance.collection('Coupan').doc(id).update({
      'name': namecontroller.text,
      'mobile': int.parse(mobilecontroler.text),
      'discount': int.parse(discountcontroller.text),
      'dob': dobcontroller.text,
      'type': typecontroller.text,
      'leed': int.parse(leedcontroller.text),
      'note': notecontroller.text
    });
    namecontroller.text = '';
    mobilecontroler.text = '';
    discountcontroller.text = '';
    dobcontroller.text = '';
    typecontroller.text = '';
    leedcontroller.text = '';
    notecontroller.text = '';
    notifyListeners();
  }

  void setvalue(String value) {
    typecontroller.text = value;
    notifyListeners();
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("Coupan").doc(id).delete();

    notifyListeners();
  }

  void validateMobileNumber(String input) {
    if (input.length != 10) {
      mobileErrorText = 'Number must be  1o characters';
    } else {
      mobileErrorText = '';
    }
    notifyListeners();
  }

  void validatedate(String input) {
    final dob = DateTime.parse(input);
    final currentdate = DateTime.now();
    final tenYearAgo = currentdate.subtract(Duration(days: 365 * 10));

    if (dob.isAfter(tenYearAgo)) {
      dateErrorText = 'date must be at least 10 year ago ';
    } else {
      dateErrorText = '';
    }
    notifyListeners();
  }

  void validateAddress(String input) {
    if (input.length <= 10) {
      noteErrorText = 'address must be greater tha 10 characters';
    } else {
      noteErrorText = '';
    }
    notifyListeners();
  }
}
