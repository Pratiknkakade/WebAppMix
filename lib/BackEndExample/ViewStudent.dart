import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/BackEndExample/StudentProvider.dart';

class ViewStudent extends StatelessWidget {
  const ViewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentprovider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: studentprovider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: studentprovider.students.length,
              itemBuilder: (context, index) {
                var student = studentprovider.students[index];
                return ListTile(
                  onTap: () {
                    studentprovider.deleteItemFromAlbumList(index);
                    studentprovider.deleteStudent(student.id);
                  },
                  title: Text(student.name),
                  subtitle: Text('Roll: ${student.roll}'),
                );
              },
            ),
    );
  }
}
