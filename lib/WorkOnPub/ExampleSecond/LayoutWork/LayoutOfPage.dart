import 'package:flutter/material.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/LayoutWork/LargeScreenView.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/LayoutWork/MediumScreenView.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/LayoutWork/SmallScreenView.dart';

class LayoutOfPage extends StatelessWidget {
  const LayoutOfPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SmallScreenView();
          } else if (constraints.maxWidth < 1200) {
            return MediumScreenView();
          } else {
            return LargeScreenView();
          }
        },
      ),
    );
  }
}
