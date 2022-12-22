import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prodcuts'),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: ListView.builder(
          itemCount: pics.length,
          itemBuilder: (context, i) {
            Photo p = pics[i];
            return ListTile(
              leading: Image.network(p.thumbnailUrl),
              title: Text("${p.title}"),
            );
          },
        ) ,
      ),
    );
  }


  List<Photo> pics = [];
  Future<dynamic> _fetchData() async{

    var response = null;

    print("GETTING DATA.....");
    try{
      response  = await Dio().get('https://jsonplaceholder.typicode.com/photos');
    } on DioError catch (e) {

    }
    print("DONE GETTING DATA.....");



    if(response != null){
      pics.clear();
      for(var x in response.data){
        Photo pic = new Photo();
        pic.id = x['id'];
        pic.albumId = x['albumId'];
        pic.title = x['title'];
        pic.thumbnailUrl = x['thumbnailUrl'];
        pics.add(pic);
      }
    }

    setState(() {

    });
    return null;
  }
}



class Photo{
  int albumId = 0;
  int id = 1;
  String title = "";
  String thumbnailUrl = "";
}