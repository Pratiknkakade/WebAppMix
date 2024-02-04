import 'package:flutter/material.dart';
import 'package:webappmix/Coupan/AddCoupanForm.dart';
import 'package:webappmix/Coupan/CoupanList.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' dash board ')),
      body: Row(
        children: [
          Expanded(flex: 4, child: AddCoupanForm()),
          Expanded(flex: 2, child: CoupanList())
        ],
      ),
    );
  }
}
