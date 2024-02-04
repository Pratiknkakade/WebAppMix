import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/Mcq/DataProvider.dart';
import 'package:webappmix/Mcq/ViewSingleMcq.dart';
import 'package:webappmix/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const viewsinglemcq(),
    );
  }
}



































// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:webappmix/Employee/EmployeeProvider.dart';
// import 'package:webappmix/WorkOnPub/ResponsiveWork/ResponsivePage.dart';
// import 'package:webappmix/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => EmployeeProvider()),
//     ],
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: ResponsivePage(
//         center: Container(
//           color: Colors.red,
//         ),
//         left: Container(
//           color: Colors.black,
//         ),
//         right: Container(
//           color: Colors.blue,
//         ),
//         heading: 'abc',
//       ),
//     );
//   }
// }
