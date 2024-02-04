import 'package:flutter/material.dart';

class HomeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile View"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _showBottomSheet(context),
          ),
        ],
      ),
      drawer:
          Drawer(child: Container(color: Colors.red)), // Red column in drawer
      body: Container(color: Colors.blue), // Blue column as main content
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.green,
          height: 200,
          child: Center(child: Text("Green Content")), // Green column content
        );
      },
    );
  }
}
