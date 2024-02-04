import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/Employee/EmployeeProvider.dart';
import 'package:webappmix/Employee/viewEmployee.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeprovider = Provider.of<EmployeeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add employee"),
      ),
      body: Center(
          child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeeprovider.namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeeprovider.addresscontroller,
                onChanged: employeeprovider.validateAddress,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'address',
                    errorText: employeeprovider.addressErrorText.isNotEmpty
                        ? employeeprovider.addressErrorText
                        : null),
              )),
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: employeeprovider.mobilenumberlist.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: Chip(
                      label: Text(employeeprovider.mobilenumberlist[index].mob),
                      backgroundColor: Colors.blue,
                      onDeleted: () {
                        employeeprovider.deleteMobileNumber(index);
                        print(employeeprovider.mobilenumberlist[index].ref);
                      },
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: employeeprovider.mobilecontroller,
                      onChanged: employeeprovider.validateNumber,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Mobile',
                        errorText: employeeprovider.numberErrorText.isNotEmpty
                            ? employeeprovider.numberErrorText
                            : null,
                      ),
                    )),
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        if (employeeprovider.numberErrorText == '') {
                          employeeprovider.insertNumber();

                          employeeprovider.mobilecontroller.text = "";
                        } else {}
                      },
                      icon: const Icon(Icons.add)))
            ],
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeeprovider.salarycontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'salary ',
                ),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (employeeprovider.mobilenumberlist.length > 0) {
              employeeprovider.insertData();
              employeeprovider.mobilecontroller.text = "";
            } else {}
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewEmployee()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
