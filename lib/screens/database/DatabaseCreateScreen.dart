import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/MovieModel.dart';

class DatabaseCreateScreen extends StatefulWidget {
  const DatabaseCreateScreen({super.key});

  @override
  State<DatabaseCreateScreen> createState() => _DatabaseCreateScreenState();
}

class _DatabaseCreateScreenState extends State<DatabaseCreateScreen> {
  MovieModel myMovie = MovieModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create table'),
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
            ElevatedButton(
              onPressed: () {
                myMovie.tableCreate();
              },
              child: Text("CREATE TABLE"),
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
