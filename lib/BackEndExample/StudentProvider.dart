import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier {
  final TextEditingController phycontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController chemcontroller = TextEditingController();
  final TextEditingController mathcontroller = TextEditingController();
  final TextEditingController rollcontroller = TextEditingController();

  List<Student> students = [];
  bool isLoading = true;

  StudentProvider() {
    fetchStudents().then((data) {
      print('--------------');
      print(data);
      students = data;
      isLoading = false;
      notifyListeners();
    });

    // notifyListeners();
  }

  void deleteItemFromAlbumList(int x) {
    students.removeAt(x);
    notifyListeners();
  }

  Future<void> deleteStudent(String studentId) async {
    final String apiUrl =
        'https://us-central1-practice-860b5.cloudfunctions.net/pratik/api/deletestudent/';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({'id': studentId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Student deleted successfully.');
      } else {
        print('Failed to delete student. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }

    notifyListeners();
  }

  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-practice-860b5.cloudfunctions.net/pratik/api/getallstudent/'));

    if (response.statusCode == 200) {
      List<dynamic> studentJson = json.decode(response.body);
      return studentJson.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  void addStudentinfo() {
    addStudentToFirebase(
        int.parse(rollcontroller.text),
        int.parse(phycontroller.text),
        int.parse(chemcontroller.text),
        int.parse(mathcontroller.text),
        namecontroller.text);

    rollcontroller.text = '';
    namecontroller.text = '';
    phycontroller.text = '';
    mathcontroller.text = '';
    chemcontroller.text = '';

    notifyListeners();
  }

  Future<void> addStudentToFirebase(
      int roll, int phy, int chem, int math, String name) async {
    const String apiUrl =
        'https://us-central1-practice-860b5.cloudfunctions.net/pratik/api/addstuddent';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'roll': roll,
          'phy': phy,
          'chem': chem,
          'math': math,
          'name': name,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Student added successfully.');
      } else {
        print('Failed to add student. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}

class Student {
  final String id;
  final int roll;
  final String name;
  final int phy;
  final int chem;
  final int math;
  //final double percentage;

  Student({
    required this.id,
    required this.roll,
    required this.name,
    required this.phy,
    required this.chem,
    required this.math,
    // required this.percentage,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      roll: json['roll'],
      name: json['name'],
      phy: json['phy'],
      chem: json['chem'],
      math: json['math'],
      //percentage: json['percentage'].toDouble(),
    );
  }
}
