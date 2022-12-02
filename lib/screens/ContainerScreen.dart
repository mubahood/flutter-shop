import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Container(

        child: Container(
          color: Colors.yellow.shade700,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(40),
          child: Text(
            "I\n❤️\nUganda".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),
          )
        ),
        alignment: Alignment.center,
        color: Colors.red.shade600,
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(40),

        /* padding: EdgeInsets.only(left: 20,right: 20),*/
      ),
    );
  }
}
