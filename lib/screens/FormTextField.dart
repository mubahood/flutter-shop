import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({super.key});

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            FormBuilderTextField(
              name: "first_name",
              initialValue: "Muhindo",
              readOnly: true,
            ),
            FormBuilderTextField(
              name: "last_name",
              enabled: true,
              maxLines: 3,
              onChanged: (val){
                print("========>$val<=========");
              },
            ),
            FormBuilderTextField(
              name: "password",
              obscureText: true,
              autofocus: true,
              textInputAction: TextInputAction.next,
            ),
            FormBuilderTextField(
              name: "country",
              textAlign: TextAlign.center,
              cursorWidth: 10,
              cursorColor: Colors.red.shade700,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
              maxLength: 10,

            ),
            FormBuilderTextField(
              name: "phone_number",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.search

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
