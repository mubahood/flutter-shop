import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Columns'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My Text #1"),
          Text("My Text #2"),
          Text("My Text #3"),
          Text("My Text #4"),
          Text("My Text #5"),
          Text("My Text #6"),
          Text("My Text #7"),
          Text("My Text #8"),
        ],
      ),
    );
  }
}
