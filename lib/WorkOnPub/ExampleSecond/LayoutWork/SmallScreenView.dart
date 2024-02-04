import 'package:flutter/material.dart';
import 'package:webappmix/WorkOnPub/ExampleSecond/ScreenConfig.dart';

class SmallScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Screen'),
        backgroundColor: smallScreenConfig.appBarColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _showBottomSheet(context),
          ),
        ],
      ),
      drawer: buildDrawer(smallScreenConfig.drawerColor),
      body: Column(
        children: smallScreenConfig.sections.map(
          (section) {
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
          },
        ).toList(),
      ),
    );
  }
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

final smallScreenConfig = ScreenConfig(
  appBarColor: Colors.blue,
  drawerColor: Colors.red,
  sections: [
    SectionConfig(
        color: Colors.blue, title: 'Blue Section', content: Container()),
  ],
);
