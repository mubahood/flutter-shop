import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage('assets/images/1.jpeg'),
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          Image(
            image: NetworkImage('https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-10/221028-black-panther-wakanda-forever-mjf-1700-ed965e.jpg') ,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ), Image(
            image: NetworkImage('https://assets-prd.ignimgs.com/2022/10/03/wakanda-forever-poster-button-1664815714839.jpg') ,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
