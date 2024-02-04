// import 'package:flutter/material.dart';
// import 'package:webappmix/Mcq/DataProvider.dart';

// CheckboxListTile ClickMcq(
//     {required int optionNumber, required String optionText, required String}) {
//   final dataProvider = DataProvider();

//   return CheckboxListTile(
//     title: Text(optionText),
//     activeColor: Colors.blue,
//     value: (dataProvider.ans == optionNumber),
//     onChanged: (value) {
//       print(value);
//       print("object");
//       dataProvider.option = (value! ? optionNumber : null)!;
//     },
//   );
// }


// //  ClickMcq()