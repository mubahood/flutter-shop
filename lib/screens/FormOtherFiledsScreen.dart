import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormOtherFiledsScreen extends StatefulWidget {
  const FormOtherFiledsScreen({super.key});

  @override
  State<FormOtherFiledsScreen> createState() => _FormOtherFiledsScreenState();
}

class _FormOtherFiledsScreenState extends State<FormOtherFiledsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form other fields'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            FormBuilderTextField(
              name: "first_name",
              readOnly: true,
              decoration: InputDecoration(
                  label: Text("First name"),
                  icon: Icon(Icons.supervised_user_circle_rounded)),
            ),
            SizedBox(
              height: 15,
            ),

            FormBuilderDateTimePicker(
              name: 'dob',
              inputType: InputType.time,
              initialValue: DateTime.now(),
              decoration: InputDecoration(
                  label: Text("Date of birth"),
                  icon: Icon(Icons.date_range)),
            ),
          ],
        ),
      ),
    );
  }

  void makeToast() {
    Fluttertoast.showToast(
      msg: "This is my Toast",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
