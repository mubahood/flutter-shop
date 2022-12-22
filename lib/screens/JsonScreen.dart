import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({super.key});

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("String to json"),
            onTap: () {
              stringToJson();
            },
          ),
          ListTile(
            title: Text("Object to json"),
            onTap: () {
              objectToJson();
            },
          ),
          ListTile(
            title: Text("From JSON to Object"),
            onTap: () {
              fromJsonToObject();
            },
          ),
        ],
      ),
    );
  }

  String raw_string = "I love mum.";
  var processed_string = "";
  Person my_person = new Person();

  void stringToJson() {
    var processed_string = jsonEncode(raw_string);
    print("=> RAW STRING: $raw_string");
    print("=> PROCESSED STRING: $processed_string");
  }

  void objectToJson() {
    my_person.name = "Muhindo Mubarak";
    processed_string = jsonEncode(my_person);
    //print(processed_string);
  }

  void fromJsonToObject() {
    objectToJson();
    //print(processed_string);
    Person my_person_2 = Person.fromJson(processed_string);
    print(my_person_2.name);
  }
}

class Person {
  String name = "Joan Doe";
  String country = "Kenya";
  int age = 21;

  static Person fromJson(String _map) {
    Map<String, dynamic> map = jsonDecode(_map);
    Person p = new Person();
    p.name = map['name'];
    p.age = map['age'];
    p.country = map['country'];
    return p;
  }

  toJson() {
    return {
      "name": name,
      "age": age,
      "country": country,
    };
  }
}
