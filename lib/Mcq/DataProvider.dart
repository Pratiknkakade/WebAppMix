import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webappmix/Mcq/McqData.dart';

class DataProvider with ChangeNotifier {
  List<McqData> mcqdata = [];
  bool isLoading = true;
  int index = 1;
  int option = 0;
  int ans = 0;
  List<DecodedMcqData> decodedMcqdata = []; // List to store decoded data

  DataProvider() {
    fetchMcq('C++ Programming', index).then((data) {
      mcqdata = data;
      decodedMcqdata = decodeMcqData(mcqdata);
      isLoading = false;
      notifyListeners();
    });
  }

  Future<List<McqData>> fetchMcq(String subject, int index) async {
    final response = await http.get(
      Uri.parse(
          'https://us-central1-chedotech-85bbf.cloudfunctions.net/api/$subject/$index'),
    );

    if (response.statusCode == 200) {
      List<dynamic> McqJson = json.decode(response.body);
      return McqJson.map((json) => McqData.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load McqJson');
    }
  }

  List<DecodedMcqData> decodeMcqData(List<McqData> mcqDataList) {
    return mcqDataList.map((mcqData) => DecodedMcqData(mcqData)).toList();
  }
}










// Future<List<McqData>> fetchMcq(String subject) async {
//     final response = await http.post(
//       Uri.parse(
//           'https://us-central1-chedotech-85bbf.cloudfunctions.net/api/getmcqs/bysubject'),
//       body: json.encode({'subject': subject}),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> McqJson = json.decode(response.body);
//       return McqJson.map((json) => McqData.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load McqJson');
//     }
//   }




///////////////////

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:webappmix/Mcq/McqData.dart';

// class DataProvider with ChangeNotifier {
//   List<McqData> mcqdata = [];
//   bool isLoading = true;

//   int option = 0;
//   int ans = 0;
//   List<DecodedMcqData> decodedMcqdata = []; // List to store decoded data

//   DataProvider() {
//     fetchMcq('C++ Programming').then((data) {
//       mcqdata = data;
//       decodedMcqdata = decodeMcqData(mcqdata);
//       isLoading = false;
//       notifyListeners();
//     });
//   }

//   Future<List<McqData>> fetchMcq(String subject) async {
//     final response = await http.post(
//       Uri.parse(
//           'https://us-central1-chedotech-85bbf.cloudfunctions.net/api/getmcqs/bysubject'),
//       body: json.encode({'subject': subject}),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> mcqJson = json.decode(response.body);
//       return mcqJson.map((json) => McqData.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load MCQ data');
//     }
//   }

//   List<DecodedMcqData> decodeMcqData(List<McqData> mcqDataList) {
//     return mcqDataList.map((mcqData) => DecodedMcqData(mcqData)).toList();
//   }

//   Future<McqData> fetchMcqByIndex(String subject, int index) async {
//     final response = await http.get(
//       Uri.parse(
//           'https://us-central1-chedotech-85bbf.cloudfunctions.net/api/$subject/$index'),
//     );

//     if (response.statusCode == 200) {
//       return McqData.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load MCQ data by index');
//     }
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
  // final TextEditingController indexController = TextEditingController();
  // String responseData = '';

  // Future<void> fetchData(String subject, String index) async {
  //   final apiUrl = 'https://us-central1-chedotech-85bbf.cloudfunctions.net/api/$subject/$index';

  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       responseData = json.decode(response.body).toString();
  //     } else {
  //       responseData = 'Error: ${response.statusCode}';
  //     }
  //   } catch (e) {
  //     responseData = 'Error: $e';
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('API Example'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         TextField(
    //           controller: indexController,
    //           decoration: InputDecoration(labelText: 'Enter Index'),
    //         ),
    //         SizedBox(height: 16.0),
    //         ElevatedButton(
    //           onPressed: () {
    //             // Replace 'C++ Programming' with the desired subject
    //             fetchData('C++ Programming', indexController.text);
    //           },
    //           child: Text('Fetch Data'),
    //         ),
    //         SizedBox(height: 16.0),
    //         Text('Response: $responseData'),
    //       ],
    //     ),
    //   ),
    // );
//   }
// }








