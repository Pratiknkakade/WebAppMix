import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  final Widget left;
  final Widget center;
  final Widget right;
  final String heading;

  const ResponsivePage(
      {Key? key,
      required this.left,
      required this.center,
      required this.right,
      required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 560;
    bool isTablet = MediaQuery.of(context).size.width >= 560 &&
        MediaQuery.of(context).size.width < 1200;

    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
        actions: isMobile
            ? [
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => _showBottomSheet(context))
              ]
            : null,
      ),
      drawer: isMobile || isTablet ? Drawer(child: left) : null,
      body: isMobile
          ? center
          : Row(
              children: [
                if (!isTablet)
                  Flexible(
                    flex: 1, // 20% of the screen width
                    child: left,
                  ),
                Flexible(
                  flex: 4, // Remaining 80% split between blue and green columns
                  child: Row(
                    children: [
                      Expanded(flex: 7, child: center),
                      Expanded(flex: 3, child: right),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1.2,
          child: right,
        );
      },
    );
  }
}
