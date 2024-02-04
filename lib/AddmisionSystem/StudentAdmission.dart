import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webappmix/AddmisionSystem/StudentAdmissionProvider.dart';

class StudentAdmission extends StatelessWidget {
  StudentAdmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentAdmissionProvider =
        Provider.of<StudentAdmissionProvider>(context);

    return Scaffold(
      //: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          //  color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Wrap(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                        ),
                        Positioned(
                          left: 20,
                          top: 0,
                          child: studentAdmissionProvider.imageUrl.isEmpty
                              ? const CircleAvatar(
                                  radius: 75,
                                  backgroundColor:
                                      Color.fromARGB(255, 241, 240, 235),
                                  backgroundImage: NetworkImage(
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))
                              : CircleAvatar(
                                  radius: 75,
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 240, 235),
                                  backgroundImage: NetworkImage(
                                      studentAdmissionProvider.imageUrl)),
                        ),
                        Positioned(
                            top: 1,
                            right: 1,
                            child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                    color: Colors.grey,
                                    child: const Icon(Icons.edit)))),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                              width: 200,
                              child: _buildGenderSelection(
                                  studentAdmissionProvider)),
                        )
                      ],
                    ),
                    Expanded(
                        child: Wrap(
                      children: [
                        Container(
                          width: 320,
                          margin: const EdgeInsets.all(10),
                          child: _buildTextField(
                            label: 'Student Name',
                            icon: const Icon(Icons.person),
                            value: studentAdmissionProvider.studentName,
                            onChanged: (value) =>
                                studentAdmissionProvider.studentName = value,
                            validator: (value) => value!.isEmpty
                                ? 'Please enter student name'
                                : null,
                          ),
                        ),
                        Container(
                            width: 200,
                            margin: const EdgeInsets.all(10),
                            child: _buildDateOfBirthDatePicker(
                                context, studentAdmissionProvider)),
                        Container(
                          width: 320,
                          margin: const EdgeInsets.all(10),
                          child: _buildTextField(
                            label: 'Email Address',
                            icon: const Icon(Icons.mail),
                            value: studentAdmissionProvider.studentMail,
                            onChanged: (value) =>
                                studentAdmissionProvider.studentMail = value,
                            validator: (value) => value!.isNotEmpty &&
                                    !value.contains('@gmail.com')
                                ? 'Enter a valid Gmail address'
                                : null,
                          ),
                        ),
                        Container(
                            width: 200,
                            margin: const EdgeInsets.all(10),
                            child: _buildStartDatePicker(
                                context, studentAdmissionProvider)),
                        Container(
                          width: 260,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            child: _buildCourseFeesField(
                                studentAdmissionProvider)),
                        Container(
                          width: 140,
                          margin: const EdgeInsets.all(10),
                          child: _buildTextField(
                            label: 'Coupon Code',
                            icon: const Icon(Icons.discount),
                            value: studentAdmissionProvider.referenceId,
                            onChanged: (value) =>
                                studentAdmissionProvider.referenceId = value,
                          ),
                        )
                      ],
                    ))
                  ],
                ),

                Container(
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  child: _buildCollegeNameField(studentAdmissionProvider),
                ),

                Container(
                  width: 250,
                  margin: const EdgeInsets.all(10),
                  child: _buildDegreeNameField(studentAdmissionProvider),
                ),

                Container(
                  width: 200,
                  margin: const EdgeInsets.all(10),
                  child: _buildAcademicYearDropdown(studentAdmissionProvider),
                ),

                Container(
                  width: 360,
                  margin: const EdgeInsets.all(10),
                  child: _buildTextField(
                    label: 'Mobile Number',
                    icon: const Icon(Icons.phone),
                    value: studentAdmissionProvider.mobileNumber,
                    onChanged: (value) =>
                        studentAdmissionProvider.mobileNumber = value,
                    validator: (value) =>
                        value!.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)
                            ? 'Enter a valid 10-digit mobile number'
                            : null,
                  ),
                ),

                Container(
                  width: 360,
                  margin: const EdgeInsets.all(10),
                  child: _buildTextField(
                    label: 'Optional Mobile Number',
                    icon: const Icon(Icons.phone),
                    value: studentAdmissionProvider.optionalContactNumber,
                    onChanged: (value) =>
                        studentAdmissionProvider.optionalContactNumber = value,
                    validator: (value) => value!.isNotEmpty &&
                            !RegExp(r'^\d{10}$').hasMatch(value)
                        ? 'Enter a valid 10-digit mobile number'
                        : null,
                  ),
                ),
                Container(
                  width: 360,
                  margin: const EdgeInsets.all(10),
                  child: _buildTextField(
                    label: 'Aadhar Number',
                    icon: const Icon(Icons.numbers),
                    value: studentAdmissionProvider.aadharNumber,
                    onChanged: (value) =>
                        studentAdmissionProvider.aadharNumber = value,
                    validator: (value) => value!.isEmpty || value.length != 12
                        ? 'Enter a valid 12-digit Aadhar number'
                        : null,
                  ),
                ),
                Container(
                  width: 360,
                  margin: const EdgeInsets.all(10),
                  child: _buildTextField(
                    label: 'Address',
                    icon: const Icon(Icons.home),
                    value: studentAdmissionProvider.address,
                    onChanged: (value) =>
                        studentAdmissionProvider.address = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an address' : null,
                  ),
                ),
                Container(
                    width: 360,
                    margin: const EdgeInsets.all(10),
                    child: _buildResetButton(studentAdmissionProvider)),
                // Add more fields here as needed
                Container(
                    width: 360,
                    margin: const EdgeInsets.all(10),
                    child: _buildSubmitButton(studentAdmissionProvider)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseFeesField(StudentAdmissionProvider provider) {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Fees',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.money)),
      keyboardType: TextInputType.number,
      initialValue: provider.courseFees.toString(),
      validator: (value) {
        if (value == null || value.isEmpty || double.tryParse(value) == null) {
          return 'Please enter valid course fees';
        }
        return null;
      },
      onChanged: (value) => provider.courseFees = double.parse(value),
    );
  }

  Widget _buildStartDatePicker(
      BuildContext context, StudentAdmissionProvider provider) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Start Date',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller:
          TextEditingController(text: formatDateTime(provider.admissionDate)),
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          provider.admissionDate = picked;
        }
      },
    );
  }

  Widget _buildDateOfBirthDatePicker(
      BuildContext context, StudentAdmissionProvider provider) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Birth Date',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller:
          TextEditingController(text: formatDateTime(provider.dateOfBirth)),
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(DateTime.now().year - 10),
          firstDate: DateTime(1970),
          lastDate: DateTime(DateTime.now().year - 10),
        );
        if (picked != null) {
          provider.dateOfBirth = picked;
        }
      },
    );
  }

  Widget _buildGenderSelection(StudentAdmissionProvider provider) {
    Color selectedColor = Colors.blue; // Color for the selected gender
    Color unselectedColor = Colors.grey; // Color for the unselected gender

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Male Icon
        GestureDetector(
          onTap: () => provider.gender = 'Male',
          child: Icon(
            size: 40,
            Icons.male,
            color: provider.gender == 'Male' ? selectedColor : unselectedColor,
          ),
        ),
        const SizedBox(height: 5), // Spacing between icons

        // Female Icon
        GestureDetector(
          onTap: () => provider.gender = 'Female',
          child: Icon(
            size: 40,
            Icons.female,
            color:
                provider.gender == 'Female' ? selectedColor : unselectedColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
    required Icon icon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            suffixIcon: icon),
        initialValue: value,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildCollegeNameField(StudentAdmissionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'College Name',
          border: OutlineInputBorder(),
        ),
        initialValue: provider.collegeName,
        onChanged: (value) => provider.collegeName = value,
        validator: (value) =>
            value!.isEmpty ? 'Please enter college name' : null,
      ),
    );
  }

  Widget _buildDegreeNameField(StudentAdmissionProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Degree Name',
          border: OutlineInputBorder(),
        ),
        initialValue: provider.degreeName,
        onChanged: (value) => provider.degreeName = value,
        validator: (value) =>
            value!.isEmpty ? 'Please enter degree name' : null,
      ),
    );
  }

  Widget _buildAcademicYearDropdown(StudentAdmissionProvider provider) {
    List<String> years = [
      "Other",
      "FY",
      "SY",
      "TY",
      "Final"
    ]; // Academic years as strings

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Academic Year',
          border: OutlineInputBorder(),
        ),
        value: provider.academicYear,
        onChanged: (newValue) {
          if (newValue != null) {
            provider.academicYear = newValue;
          }
        },
        items: years.map<DropdownMenuItem<String>>((String year) {
          return DropdownMenuItem<String>(
            value: year,
            child: Text(year),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSubmitButton(StudentAdmissionProvider provider) {
    return ElevatedButton(
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   // Implement admission logic
        //   print('Admission successful');
        // }
      },
      child: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Text('Admit Student'),
      ),
    );
  }

  Widget _buildResetButton(StudentAdmissionProvider provider) {
    return ElevatedButton(
      onPressed: () {
        provider.resetForm();
      },
      child: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Text('Reset Form'),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String day = dateTime.day.toString().padLeft(2, '0');
  String monthName = monthNames[dateTime.month - 1];
  String year = dateTime.year.toString();

  return "$day $monthName $year";
}
