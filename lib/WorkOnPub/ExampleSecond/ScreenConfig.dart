import 'package:flutter/material.dart';

class ScreenConfig {
  final Color appBarColor;
  final Color drawerColor;
  final List<SectionConfig> sections;

  ScreenConfig({
    required this.appBarColor,
    required this.drawerColor,
    required this.sections,
  });
}

class SectionConfig {
  final Color color;
  final String title;
  final Widget content;

  SectionConfig({
    required this.color,
    required this.title,
    required this.content,
  });
}

class ColoredContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const ColoredContainer({
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: child,
    );
  }
}

Widget buildDrawer(Color drawerColor) {
  return Drawer(
    child: Container(
      color: drawerColor,
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'Red Drawer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
