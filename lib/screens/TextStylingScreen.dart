import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStylingScreen extends StatefulWidget {
  const TextStylingScreen({super.key});

  @override
  State<TextStylingScreen> createState() => _myState();
}

class _myState extends State<TextStylingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text styling'),
      ),
      body: ListView(
        children: [
          Container(
            child: Text(
              "My textMy textMy textMy My textMy textMy textMy textMy textMy text textMy textMy textMy textMy textMy textMy text My text My text...",
              textAlign: TextAlign.justify,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(),
            ),
          ),
          Container(
            child: Text(
              "My Text",
              style: TextStyle(
                color: Colors.red.shade700,
                backgroundColor: Colors.yellow,
                fontSize: 50,
                fontStyle: FontStyle.italic,
                letterSpacing: 4,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              "Container stlying",
              style: TextStyle(
                color: Colors.red.shade700,
                backgroundColor: Colors.yellow,
                fontSize: 50,
                fontStyle: FontStyle.italic,
                letterSpacing: 4,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
