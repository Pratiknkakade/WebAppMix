import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Small screen
            return buildSmallScreen(context);
          } else if (constraints.maxWidth < 1200) {
            // Medium screen with Drawer
            return buildMediumScreen(context);
          } else {
            // Large screen
            return buildLargeScreen();
          }
        },
      ),
    );
  }
}

Widget buildSmallScreen(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Small Screen'),
    ),
    drawer: Drawer(
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
    body: Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Blue Section',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  color: Colors.green,
                  height: 200,
                  child: const Center(
                    child: Text(
                      'Green Section in Bottom Sheet',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Show Green Bottom Sheet'),
        ),
      ],
    ),
  );
}

Widget buildMediumScreen(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Medium Screen'),
    ),
    drawer: Drawer(
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
    body: Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Blue Section',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            width: 100,
            child: const Center(
              child: Text(
                'Green Section',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildLargeScreen() {
  return Row(
    children: [
      Expanded(
        child: Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              'Red Section',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Blue Section',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.green,
          child: const Center(
            child: Text(
              'Green Section',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}
