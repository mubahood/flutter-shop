import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mshop/models/AppConfig.dart';
import 'package:mshop/models/Utils.dart';
import 'package:mshop/screens/ContainerScreen.dart';
import 'package:mshop/screens/ContainerStylingScreen.dart';
import 'package:mshop/screens/FormDecoration.dart';
import 'package:mshop/screens/FormOtherFiledsScreen.dart';
import 'package:mshop/screens/FormTextField.dart';
import 'package:mshop/screens/HttpRequestSreen.dart';
import 'package:mshop/screens/ImagesScreen.dart';
import 'package:mshop/screens/JsonScreen.dart';
import 'package:mshop/screens/ProdcutsScreen.dart';
import 'package:mshop/screens/RowsScreen.dart';
import 'package:mshop/screens/TextStylingScreen.dart';
import 'package:mshop/screens/ToastScreen.dart';
import 'package:mshop/screens/database/DatabaseCreateScreen.dart';
import 'package:mshop/screens/database/DatabaseInsertScreen.dart';
import 'package:mshop/screens/database/DatabaseSelectScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            title: Text("Products"),
            leading: Icon(Icons.add_shopping_cart),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("List of products"),
            onTap: () {
              //createUser();
              //return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("HttpRequest"),
            leading: Icon(Icons.http),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Internet communication..."),
            onTap: () {
              //createUser();
              //return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HttpRequestSreen(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("JSON"),
            leading: Icon(Icons.join_inner_sharp),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Json data formart..."),
            onTap: () {
              //createUser();
              //return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JsonScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: Text("Login"),
            leading: Icon(Icons.view_column_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
             Utils.navigate_to(AppConfig.LoginScreen, context);

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
          ListTile(
            title: Text("DB - Table create"),
            leading: Icon(Icons.table_chart),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("How to create local db tables"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatabaseCreateScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("DB - Insert data into table"),
            leading: Icon(Icons.create),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("How to save data locally"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatabaseInsertScreen(),
                ),
              );
            },
          ),


          ListTile(
            title: Text("DB - Select data from table"),
            leading: Icon(Icons.list),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("How to get data from local db"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatabaseSelectScreen(),
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
