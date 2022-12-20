import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginnState();
}

class _LoginnState extends State<LoginScreen> {
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
