import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HttpRequestSreen extends StatefulWidget {
  const HttpRequestSreen({super.key});

  @override
  State<HttpRequestSreen> createState() => _HttpRequestSreenState();
}

class _HttpRequestSreenState extends State<HttpRequestSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("HTTP GET"),
            onTap: () {
              httpGet();
            },
          ),


        ],
      ),
    );
  }

  void httpGet () async {

    int x = 12;
    int y = 0;
    var response = null;

    try{
      response  = await Dio().get('https://dummyjson.com/products');
      print("===success===");
    } on DioError catch (e) {
      print(e.response?.toString());
      print("FAILED...");
    }

    print(response);

    return;


    print("START FETCHING.....");





    print("DONE FETCHING.....");

    if(response == null){
      print("dailed because resp is null");
    }else{
      print("DOD NOT FAILED");
    }
    print(response);

  }



}
