import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/Coupan/CoupanProvider.dart';

class CoupanList extends StatelessWidget {
  const CoupanList({super.key});

  @override
  Widget build(BuildContext context) {
    final coupanprovider = Provider.of<CoupanProvider>(context);
    return Scaffold(
      //   appBar: AppBar(title: Text(' coupan list')),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: coupanprovider.usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return InkWell(
                  onLongPress: () {
                    coupanprovider.deleteFromDataBase(document.id.toString());
                    data.remove(data);
                  },
                  // onTap: () {
                  //   coupanprovider.docId = document.id.toString();
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => UpdateIntern()),
                  //   );
                  // },
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(
                      data['leed'].toString(),
                      style: const TextStyle(fontSize: 10),
                    )),
                    title: Text(data['name']),
                    subtitle: Text(data['mobile'].toString()),
                    trailing: Text(data['discount'].toString()),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const AddCoupanForm()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
