import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/Employee/EmployeeProvider.dart';

class ViewEmployee extends StatelessWidget {
  const ViewEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeprovider = Provider.of<EmployeeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Employe list ')),
        body: StreamBuilder<QuerySnapshot>(
          stream: employeeprovider.usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return InkWell(
                  child: ListTile(
                    title: Text(data['number'].toString()),
                    subtitle: Text(document.id.toString()),
                  ),
                );
              }).toList(),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(AddEmployee());
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
