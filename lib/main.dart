import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mshop/screens/ColumnsScreen.dart';
import 'package:mshop/screens/ContainerScreen.dart';
import 'package:mshop/screens/ContainerStylingScreen.dart';
import 'package:mshop/screens/FormDecoration.dart';
import 'package:mshop/screens/FormOtherFiledsScreen.dart';
import 'package:mshop/screens/FormTextField.dart';
import 'package:mshop/screens/ImagesScreen.dart';
import 'package:mshop/screens/RowsScreen.dart';
import 'package:mshop/screens/TextStylingScreen.dart';
import 'package:mshop/screens/ToastScreen.dart';

Future main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  createUser() {
    print("========ROMINA START=========");

    CollectionReference<Map<String, dynamic>> userCollection =
        FirebaseFirestore.instance.collection('users');
    userCollection.add({
      'name': 'Romina K',
      'age': 2,
    });

    print("========ROMINA DONE=========");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Coulumns"),
            leading: Icon(Icons.view_column_outlined),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("All about columns..."),
            onTap: () {
              //createUser();
              //return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColumnScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Rows"),
            leading: Icon(Icons.table_rows_outlined),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("All about rows..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RowsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Container"),
            leading: Icon(Icons.check_box_outline_blank),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("All about container..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContainerScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Images"),
            leading: Icon(Icons.photo_size_select_actual_outlined),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("All about images..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImagesScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Text styling"),
            leading: Icon(Icons.text_fields_outlined),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Decorating text..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextStylingScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("Container styling"),
            leading: Icon(Icons.deblur_rounded),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Decorating containers..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContainerStylingScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Toast"),
            leading: Icon(Icons.touch_app),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("How to make pop ups"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ToastScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("Form Text Fild"),
            leading: Icon(Icons.text_fields),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Text input"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormTextField(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("Form decoration"),
            leading: Icon(Icons.dark_mode_sharp),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Decorating the input fields"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormDecoration(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("Form other fields"),
            leading: Icon(Icons.other_houses),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Other input fields"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormOtherFiledsScreen(),
                ),
              );
            },
          ),

          /*InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColumnScreen(),
                ),
              );
            },
            child: Text("Columns"),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColumnScreen(),
                ),
              );
            },
            child: Text("Columns"),
          ),*/
        ],
      ),
    );
  }
}
