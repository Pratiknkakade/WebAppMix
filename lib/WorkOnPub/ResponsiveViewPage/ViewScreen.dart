import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Example'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Small screen: 1 column, 4 rows
            return buildGrid(1, 4);
          } else if (constraints.maxWidth < 900) {
            // Medium screen: 2 columns, 2 rows
            return buildGrid(2, 2);
          } else if (constraints.maxWidth < 1200) {
            return buildGrid(3, 2);
          } else {
            // Large screen: 1 row, 4 columns
            return buildGrid(4, 1);
          }
        },
      ),
    );
  }
}

Widget buildGrid(int crossAxisCount, int rowCount) {
  List<Color> colors = [Colors.blue, Colors.black, Colors.red, Colors.green];

  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 3,
      crossAxisCount: crossAxisCount,
    ),
    itemCount: colors.length,
    itemBuilder: (context, index) {
      return Card(
        color: colors[index % colors.length],
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            '.col',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
}
