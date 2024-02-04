import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/BackEndExample/StudentProvider.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentprovider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' add student')),
      body: Center(
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: studentprovider.namecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: studentprovider.rollcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'roll',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: studentprovider.phycontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'phy',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: studentprovider.chemcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'chem',
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: studentprovider.mathcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'math',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            studentprovider.addStudentinfo();
          },
          child: const Icon(Icons.add)),
    );
  }
}
