import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'ResponseModel.dart';
import 'Utils.dart';

class UserModel {
  static CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  String id = "";
  String first_name = "";
  String last_name = "";
  String sex = "";
  String phone_number = "";
  String user_type = "";
  String password = "";
  String address = "";

  Future<ResponseModel> saveNewUser() async {
    ResponseModel resp = new ResponseModel();
    UserModel userModel = await getUserByPhoneNumber(phone_number);

    if (userModel.phone_number.isNotEmpty) {
      resp.data = userModel;
      resp.status = 0;
      resp.data = null;
      return resp;
    }

    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection('users');


    var res = await collectionReference.doc(this.id).set(
          this.toJson(),
        ).then((value) {
          print("=====done===");
      });

    print(res);

    Utils.toast("saving...");

    return resp;
  }

  toJson() {
    return {
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "sex": sex,
      "phone_number": phone_number,
      "user_type": user_type,
      "password": password,
      "address": address,
    };
  }

  static Future<UserModel> getUserByPhoneNumber(String phoneNumber) async {
    UserModel userModel = new UserModel();
    QuerySnapshot querySnapshot = await userCollection
        .where('phone_number', isEqualTo: phoneNumber)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return userModel;
    }

    for (QueryDocumentSnapshot x in querySnapshot.docs) {
      userModel.phone_number = x.get('phone_number').toString();
      break;
    }

    return userModel;
  }
}
