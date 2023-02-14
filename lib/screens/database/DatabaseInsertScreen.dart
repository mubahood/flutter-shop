import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mshop/models/Utils.dart';

import '../../models/AppConfig.dart';
import '../../models/MovieModel.dart';

class DatabaseInsertScreen extends StatefulWidget {
  dynamic data;

  DatabaseInsertScreen({this.data, super.key});

  @override
  State<DatabaseInsertScreen> createState() => _DatabaseInsertScreenState();
}

class _DatabaseInsertScreenState extends State<DatabaseInsertScreen> {
  MovieModel myMovie = MovieModel();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initForm();
  }

  bool isEditing = false;

  initForm() {
    if (widget.data == null) {
      return;
    }

    if (widget.data.runtimeType.toString() != 'MovieModel') {
      return;
    }

    myMovie = widget.data;
    isEditing = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(isEditing ? "Editing - ${myMovie.title}" : 'Adding new movie'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "title",
                initialValue: myMovie.title,
                onChanged: (x) {
                  myMovie.title = x.toString();
                },
                decoration: InputDecoration(
                    label: Text("Movie title"), icon: Icon(Icons.title)),
              ),
              FormBuilderTextField(
                name: "actor",
                initialValue: myMovie.actor,
                onChanged: (x) {
                  myMovie.actor = x.toString();
                },
                decoration: InputDecoration(
                    label: Text("Movie actor"), icon: Icon(Icons.person)),
              ),
              FormBuilderDropdown<String>(
                name: 'category',
                initialValue: myMovie.category,
                onChanged: (x) {
                  myMovie.category = x.toString();
                },
                decoration: InputDecoration(
                    label: Text("Movie category"), icon: Icon(Icons.category)),
                items: AppConfig.movieCategories
                    .map((name) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: name,
                          child: Text(name),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  saveMovie();
                },
                child: Text(isEditing ? 'UPDATE MOVIE' : "SAVE MOVIE"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveMovie() async {
    /*
    collect values
    print(_formKey.currentState!.fields['actor']?.value.toString());

    and updating values
    _formKey.currentState!.patchValue({
      'actor': 'Jacki Chan',
      'title': 'The drunken master',
    });*/

    if (myMovie.title.length < 3) {
      Utils.toast("Enter correct movie title.", color: Colors.red);
      return;
    }
    if (myMovie.actor.length < 3) {
      Utils.toast("Enter actor movie actor.", color: Colors.red);
      return;
    }

    if (myMovie.category.length < 3) {
      Utils.toast("Enter category movie title.", color: Colors.red);
      return;
    }

    bool resp = await myMovie.save();

    if (resp) {
      Utils.toast("Saved successfully!");
      if (!isEditing) {
        _formKey.currentState!.reset();
      }
      //Navigator.pop(context);
    } else {
      Utils.toast("Failed to save.");
    }

    //myMovie.tableCreate();
  }
}
