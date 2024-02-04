import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/Coupan/CoupanProvider.dart';

class AddCoupanForm extends StatelessWidget {
  const AddCoupanForm({super.key});

  @override
  Widget build(BuildContext context) {
    final coupanprovider = Provider.of<CoupanProvider>(context);
    return Scaffold(
      //appBar: AppBar(title: const Text(' Add Coupan form')),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    child: TextField(
                      controller: coupanprovider.namecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: coupanprovider.mobilecontroler,
                      onChanged: coupanprovider.validateMobileNumber,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'mobile number',
                          errorText: coupanprovider.mobileErrorText.isNotEmpty
                              ? coupanprovider.mobileErrorText
                              : null),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: coupanprovider.dobcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: 'date od birth (YYYY-MM-DD)',
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(DateTime.now().year - 10),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(DateTime.now().year - 10),
                        );
                        coupanprovider.dobcontroller.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate!);
                      },
                    )),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: DropdownButton<String>(
                      value: coupanprovider.list.first,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.

                        coupanprovider.setvalue(value!);
                      },
                      items: coupanprovider.list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: coupanprovider.discountcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'discount',
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: coupanprovider.leedcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' lead ',
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: coupanprovider.notecontroller,
                      onChanged: coupanprovider.validateAddress,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'note',
                          errorText: coupanprovider.noteErrorText.isNotEmpty
                              ? coupanprovider.noteErrorText
                              : null),
                    )),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          coupanprovider.insertData();
          //  Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
