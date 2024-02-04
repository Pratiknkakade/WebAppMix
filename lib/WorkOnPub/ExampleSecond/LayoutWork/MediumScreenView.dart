import 'package:flutter/material.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/ScreenConfig.dart';

class MediumScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium Screen'),
        backgroundColor: mediumScreenConfig.appBarColor,
      ),
      drawer: buildDrawer(mediumScreenConfig.drawerColor),
      body: Row(
        children: mediumScreenConfig.sections.map((section) {
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
      ),
    );
  }
}

final mediumScreenConfig = ScreenConfig(
  appBarColor: Colors.orange,
  drawerColor: Colors.red,
  sections: [
    SectionConfig(
        color: Colors.blue, title: 'Blue Section', content: Container()),
    SectionConfig(
        color: Colors.green, title: 'Green Section', content: Container()),
  ],
);
