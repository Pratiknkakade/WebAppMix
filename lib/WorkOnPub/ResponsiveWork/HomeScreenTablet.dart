import 'package:flutter/material.dart';

class HomeScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tablet View")),
      drawer:
          Drawer(child: Container(color: Colors.red)), // Red column in drawer
      body: Row(
        children: <Widget>[
          Expanded(child: Container(color: Colors.blue)), // Blue column
          Expanded(child: Container(color: Colors.green)), // Green column
        ],
      ),
    );
  }
}
