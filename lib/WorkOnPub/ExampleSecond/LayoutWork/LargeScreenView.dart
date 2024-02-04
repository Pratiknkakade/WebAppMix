import 'package:flutter/material.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/ScreenConfig.dart';

class LargeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: largeScreenConfig.sections.map((section) {
        return Expanded(
          child: ColoredContainer(
            color: section.color,
            child: Center(
              child: Text(
                section.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

final largeScreenConfig = ScreenConfig(
  appBarColor: Colors.purple,
  drawerColor: Colors.red,
  sections: [
    SectionConfig(
        color: Colors.red, title: 'Red Section', content: Container()),
    SectionConfig(
        color: Colors.blue, title: 'Blue Section', content: Container()),
    SectionConfig(
        color: Colors.green, title: 'Green Section', content: Container()),
  ],
);
