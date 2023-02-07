import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mshop/models/Utils.dart';

import '../../models/AppConfig.dart';
import '../../models/MovieModel.dart';

class DatabaseInsertScreen extends StatefulWidget {
  const DatabaseInsertScreen({super.key});

  @override
  State<DatabaseInsertScreen> createState() => _DatabaseInsertScreenState();
}

class _DatabaseInsertScreenState extends State<DatabaseInsertScreen> {
  MovieModel myMovie = MovieModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert data into table'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            FormBuilderTextField(
              name: "title",
              onChanged: (x) {
                myMovie.title = x.toString();
              },
              decoration: InputDecoration(
                  label: Text("Movie title"), icon: Icon(Icons.title)),
            ),
            FormBuilderTextField(
              name: "actor",
              onChanged: (x) {
                myMovie.actor = x.toString();
              },
              decoration: InputDecoration(
                  label: Text("Movie actor"), icon: Icon(Icons.person)),
            ),
            FormBuilderDropdown<String>(
              name: 'category',
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
              child: Text("SAVE MOVIE"),
            ),
          ],
        ),
      ),
    );
  }

  void saveMovie() {
    if (myMovie.title.length < 3) {
      Utils.toast("Enter correct movie title.", color: Colors.red);
      return;
    }
    if (myMovie.actor.length < 3) {
      Utils.toast("Enter actor movie title.", color: Colors.red);
      return;
    }

    if (myMovie.category.length < 3) {
      Utils.toast("Enter category movie title.", color: Colors.red);
      return;
    }


    Utils.toast("Saving...");

    //myMovie.tableCreate();
  }
}
