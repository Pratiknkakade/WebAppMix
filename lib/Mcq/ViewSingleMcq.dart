import 'package:flutter/material.dart';
import 'package:webappmix/Mcq/DataProvider.dart';

class viewsinglemcq extends StatelessWidget {
  const viewsinglemcq({Key? key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = DataProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
                    dataProvider.index = index;
                    dataProvider.fetchMcq('C++ Programming', index + 1);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Question: ${dataProvider.decodedMcqdata[index].decodedQuestion}',
                          ),
                          content: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Option1: ${dataProvider.decodedMcqdata[index].decodedOption1}',
                                ),
                                Text(
                                  'Option2: ${dataProvider.decodedMcqdata[index].decodedOption2}',
                                ),
                                Text(
                                  'Option3: ${dataProvider.decodedMcqdata[index].decodedOption3}',
                                ),
                                Text(
                                  'Option4: ${dataProvider.decodedMcqdata[index].decodedOption4}',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
