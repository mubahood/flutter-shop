import 'package:cloud_firestore/cloud_firestore.dart';

import 'ResponseModel.dart';

class UserModel{

  static CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection('users');

  String id = "";
  String first_name = "";
  String last_name = "";
  String sex = "";
  String phone_number = "";

  Future<ResponseModel> saveNewUser() async{
    ResponseModel resp = new ResponseModel();


    UserModel userModel =  await getUserByPhoneNumber(phone_number);

    return resp;
  }


  static Future<UserModel> getUserByPhoneNumber(String phoneNumber) async {
    UserModel userModel = new UserModel();
    print("GETING...");
    QuerySnapshot querySnapshot = await userCollection.where(
        'age',isEqualTo: 1
    ).get();

    if(querySnapshot.docs.isEmpty){
     return userModel;
    }


    for(QueryDocumentSnapshot x in querySnapshot.docs){

      userModel.phone_number = x.get('age');

    }

    return userModel;
  }

}