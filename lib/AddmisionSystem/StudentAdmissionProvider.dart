import 'dart:html' as html;

import 'package:flutter/foundation.dart';

class StudentAdmissionProvider with ChangeNotifier {
  String studentName = '';
  String address = '';
  String mobileNumber = '';
  String optionalContactNumber = '';
  String gender = '';
  String aadharNumber = '';
  String referenceId = '';
  DateTime admissionDate = DateTime.now();
  DateTime dateOfBirth = DateTime.now();
  String batchTime = '';
  double outstandingAmount = 0.0;
  List<DateTime> presenteeDates = [];
  String imageThumbnail = '';
  String pursuingCourse = '';
  String studentMail = '';
  String selectedCourseName = '';
  String collegeName = '';
  String degreeName = '';
  String academicYear = 'Other';
  double courseFees = 0;

  String imageUrl = '';
  html.File? image; // Use html.File for web compatibility

  set setSelectedCourseName(String courseName) {
    selectedCourseName = courseName;
    notifyListeners();
  }

  void admitStudent({
    required String studentName,
    required String address,
    required String mobileNumber,
    String? optionalContactNumber,
    required String gender,
    required String aadharNumber,
    required String referenceId,
    required DateTime admissionDate,
    required DateTime dateOfBirth,
    required String batchTime,
    required double outstandingAmount,
    required List<DateTime> presenteeDates,
    required String imageUrl,
    required String imageThumbnail,
    required String pursuingCourse,
    required String studentMail,
  }) {
    this.studentName = studentName;
    this.address = address;
    this.mobileNumber = mobileNumber;
    this.optionalContactNumber = optionalContactNumber ?? '';
    this.gender = gender;
    this.aadharNumber = aadharNumber;
    this.referenceId = referenceId;
    this.admissionDate = admissionDate;
    this.dateOfBirth = dateOfBirth;
    this.batchTime = batchTime;
    this.outstandingAmount = outstandingAmount;
    this.presenteeDates = presenteeDates;
    this.imageUrl = imageUrl;
    this.imageThumbnail = imageThumbnail;
    this.pursuingCourse = pursuingCourse;
    this.studentMail = studentMail;

    notifyListeners();
  }

  // Function to pick and upload image
  // Future<void> pickAndUploadImage() async {
  //   final html.FileUploadInputElement input = html.FileUploadInputElement()
  //     ..accept = 'image/*';
  //   input.click();

  //   input.onChange.listen((event) {
  //     final file = input.files!.first;
  //     final reader = html.FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) async {
  //       image = file;
  //       notifyListeners();
  //       await uploadImageToFirebase(file);
  //     });
  //   });
  // }

  // Function to upload image to Firebase Storage
  // Future<void> uploadImageToFirebase(html.File imageFile) async {
  //   try {
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(imageFile);
  //     await reader.onLoad.first;

  //     final path =
  //         'uploads/${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';
  //     final storageRef = FirebaseStorage.instance.ref().child(path);
  //     final uploadTask = storageRef.putData(reader.result as Uint8List);

  //     final snapshot = await uploadTask.whenComplete(() {});
  //     final downloadUrl = await snapshot.ref.getDownloadURL();
  //     imageUrl = downloadUrl;
  //     notifyListeners();
  //   } catch (e) {
  //     print("Error uploading image: $e");
  //   }
  // }

  void resetForm() {
    studentName = '';
    address = '';
    mobileNumber = '';
    optionalContactNumber = '';
    gender = '';
    aadharNumber = '';
    referenceId = '';
    admissionDate = DateTime.now();
    dateOfBirth = DateTime.now();
    batchTime = '';
    outstandingAmount = 0.0;
    presenteeDates = [];
    imageUrl = '';
    imageThumbnail = '';
    pursuingCourse = '';
    studentMail = '';
    image = null; // Reset the image to null

    notifyListeners();
  }
}
