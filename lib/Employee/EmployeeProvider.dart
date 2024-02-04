import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  List<Mobile> mobilenumberlist = [];
  List<String> mobileRefs = [];
  String addressErrorText = '';
  String numberErrorText = '';

  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('mobile').snapshots();

  void deleteMobileNumber(int index) async {
    await FirebaseFirestore.instance
        .collection('mobile')
        .doc(mobilenumberlist[index].ref.toString())
        .delete();
    mobilenumberlist.removeAt(index);
    mobileRefs.removeAt(index);
    notifyListeners();
  }

  void insertNumber() async {
    CollectionReference conn = FirebaseFirestore.instance.collection('mobile');
    String mm = mobilecontroller.text;
    var refid = await conn.add({
      'number': mm,
    });
    mobileRefs.add(refid.id);
    mobilenumberlist.add(Mobile(refid.id.toString(), mm));

    notifyListeners();
  }

  void insertData() async {
    CollectionReference employee =
        FirebaseFirestore.instance.collection('data');

    employee.add({
      'name': namecontroller.text,
      'address': addresscontroller.text,
      'salary': int.parse(salarycontroller.text),
      'mobile': mobileRefs,
    });
    print('--------------------');
    print(mobileRefs.length);
    print('--------');

    print(mobilenumberlist.length);
    print('--------------------');

    namecontroller.text = '';
    addresscontroller.text = '';
    salarycontroller.text = '';
    notifyListeners();
  }

  void validateNumber(String input) {
    if (input.length != 10) {
      numberErrorText = ' number must be 10 digit';
    } else {
      numberErrorText = '';
    }
    notifyListeners();
  }

  void validateAddress(String input) {
    if (input.length <= 10) {
      addressErrorText = 'address must be greater tha 10 characters';
    } else {
      addressErrorText = '';
    }
    notifyListeners();
  }
}

class Mobile {
  String ref, mob;

  Mobile(this.ref, this.mob);
}
