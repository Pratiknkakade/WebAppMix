import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpWorking extends StatefulWidget {
  const HttpWorking({super.key});

  @override
  State<HttpWorking> createState() => _HttpWorkingState();
}

class _HttpWorkingState extends State<HttpWorking> {
  Future<List<dynamic>> getrequest() async {
    var url = Uri.parse('https://reqres.in/api/users?page=2');

    var responce = await http.get(url);
    print(responce.statusCode.toString());

    return jsonDecode(responce.body);
  }

  // void posRequest() async {
  //   var url = Uri.parse('https://reqres.in/api/login');
  //   var data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
  //   var responce = await http.post(url, body: data);
  //   print(responce.statusCode.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' http ')),
      // body: FutureBuilder(
      //     future: getrequest(),
      //     builder: (context, snapshot) {
      //       print(snapshot.data);
      //     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getrequest();
          print(getrequest());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
