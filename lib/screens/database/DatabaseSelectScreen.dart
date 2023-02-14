import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../models/MovieModel.dart';
import 'DatabaseInsertScreen.dart';

class DatabaseSelectScreen extends StatefulWidget {
  const DatabaseSelectScreen({super.key});

  @override
  State<DatabaseSelectScreen> createState() => _DatabaseSelectScreenState();
}

class _DatabaseSelectScreenState extends State<DatabaseSelectScreen> {
  MovieModel myMovie = MovieModel();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get data from tables'),
        actions: [
          InkWell(
            onTap: () {
              doAddMovie();
            },
            child: Container(
                padding: EdgeInsets.only(right: 29),
                child: Icon(
                  Icons.add,
                  size: 35,
                )),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: FormBuilder(
          key: _formKey,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              MovieModel m = items[i];
              return ListTile(
                title: Text(m.title),
                subtitle: Text("By ${m.actor} - ${m.category}"),
                leading: InkWell(
                  onTap: () {
                    doEdit(m);
                  },
                  child: Icon(Icons.edit),
                ),
                trailing: InkWell(
                  onTap: () {
                    doDelete(m);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  doDelete(MovieModel item) async {
    await item.deleteItem();
    getMovies();
  }

  doEdit(MovieModel item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatabaseInsertScreen(
          data: item,
        ),
      ),
    );

    getMovies();
  }

  List<MovieModel> items = [];

  void getMovies() async {
    items = await MovieModel.getItems();
    setState(() {});
  }

  Future<void> doAddMovie() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatabaseInsertScreen(),
      ),
    );
    getMovies();
  }
}
