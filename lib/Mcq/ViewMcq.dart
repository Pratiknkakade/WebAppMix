import 'package:flutter/material.dart';
import 'package:webappmix/Mcq/DataProvider.dart';
import 'package:webappmix/Mcq/McqData.dart';

class ViewMcq extends StatelessWidget {
  const ViewMcq({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = DataProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded Questions'),
      ),
      body: FutureBuilder<List<McqData>>(
        future: dataProvider.fetchMcq(
          'C++ Programming',
          dataProvider.index,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                var mcqData = snapshot.data![index];
                dataProvider.ans = mcqData.ans;

                return Container(
                  // padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: const Color.fromARGB(255, 110, 134, 153),
                  ),
                  child: Center(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(fontSize: 8.0),
                        ),
                      ),
                      onTap: () {
                        // Show an alert dialog when tapped
                        dataProvider.index = index;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  'Question: ${dataProvider.decodedMcqdata[index].decodedQuestion}'),
                              content: Center(
                                child: Column(
                                  children: [
                                    Text(
                                        'Option1: ${dataProvider.decodedMcqdata[index].decodedOption1}'),
                                    Text(
                                        'Option2: ${dataProvider.decodedMcqdata[index].decodedOption2}'),
                                    Text(
                                        'Option3: ${dataProvider.decodedMcqdata[index].decodedOption3}'),
                                    Text(
                                        'Option4: ${dataProvider.decodedMcqdata[index].decodedOption4}'),
                                  ],
                                ),
                              ),
                              // actions: const [
                              // TextButton(
                              //   onPressed: () {
                              //     Navigator.of(context).pop();
                              //     // Navigate to the detailed view if needed
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => ViewSingleMcq(
                              //           dataProvider.decodedMcqdata[index],
                              //           mcqData,
                              //         ),
                              //       ),
                              //     );
                              //   },
                              //   child: Text('OK'),
                              // ),
                              //  ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}





// var mcqData = snapshot.data![index];







// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Popup Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Show the dialog when the button is pressed
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Popup Title'),
//                   content: Text('This is a popup message.'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         // Close the dialog when the "OK" button is pressed
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//           child: Text('Show Popup'),
//         ),
//       ),
//     );
//   }
// }

