import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mshop/models/ResponseModel.dart';
import 'package:mshop/models/Utils.dart';

import '../../models/AppConfig.dart';
import '../../models/UserModel.dart';
import '../../theme/custom_theme.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> submit_form() async {

    UserModel new_user = UserModel();
    new_user.id = UserModel.userCollection.doc().id.toString();
    new_user.first_name = "Hamad";
    new_user.last_name = "Muzdalfa";
    new_user.sex = "Male";
    new_user.phone_number = "0783204665";
    new_user.user_type = "admin";
    new_user.password = "4321";
    new_user.address = "Pretoria";

    new_user.saveNewUser();

    return ;


    if (!_formKey.currentState!.validate()) {
      Utils.toast("Please fix errors in the form.", color: Colors.red);
      return;
    }

    setState(() {
      is_loading = true;
    });

    UserModel u = await UserModel.getUserByPhoneNumber(_formKey.currentState?.fields['phone_number']?.value);

    setState(() {
      is_loading = false;
    });

    if(u.phone_number.isEmpty){
      Utils.toast("User account not found.");
      return;
    }
    print("Good to go with ==> ${u.phone_number}");
    //print(r.message);
    return;

    Map<String, dynamic> form_data_map = {};
    form_data_map = {
      'phone_number': _formKey.currentState?.fields['phone_number']?.value,
      'password': _formKey.currentState?.fields['password']?.value,
    };


    print("=========GETTING====");
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await userCollection.where(
      'age',isEqualTo: 1
    ).get();



    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print("FOUND ===> ${allData.length} <====");

    Utils.toast("Good to! love");
    return;

    is_loading = true;
    error_message = "";
    setState(() {});


    is_loading = false;
    setState(() {});

    Navigator.pushNamedAndRemoveUntil(
        context, "/OnBoardingScreen", (r) => false);
    Utils.toast("Logged in successfully.", color: Colors.green);
  }

  String error_message = "";
  bool is_loading = false;

  @override
  void initState() {
    Utils.init_theme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(color: Colors.white)),
      body: ListView(
        children: [
          FxContainer(
              borderRadiusAll: 0,
              marginAll: 0,
              padding:
              EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 10),
              color: Colors.white,
              child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 20,
                        color: Colors.white,
                      ),
                      Image(
                        width: 170,
                        fit: BoxFit.cover,
                        image: AssetImage(AppConfig.LOGO),
                      ),
                      /* SizedBox(
                        height: 20,
                      ),
                      FxText.titleLarge("Sign in"),*/
                      SizedBox(
                        height: 40,
                      ),
                      Container(height: 25),
                      FormBuilderTextField(
                        name: 'phone_number',
                        autofocus: false,
                        initialValue: "0783204665",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "This field is required.",
                          ),
                        ]),
                        decoration: InputDecoration(
                          enabledBorder: CustomTheme.input_outline_border,
                          border: CustomTheme.input_outline_focused_border,
                          labelText: "Phone number",
                        ),
                      ),
                      Container(height: 25),
                      FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        initialValue: "4321",
                        autofocus: false,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          enabledBorder: CustomTheme.input_outline_border,
                          border: CustomTheme.input_outline_focused_border,
                          labelText: "Password",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "Password is required.",
                          ),
                        ]),
                      ),
                      Container(height: 10),
                      error_message.isEmpty
                          ? SizedBox()
                          : FxContainer(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.red.shade50,
                        child: Text(
                          error_message,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: is_loading
                            ? Center(
                          child: Container(
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(15),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.red),
                            ),
                          ),
                        )
                            : CupertinoButton(
                            color: CustomTheme.primary,
                            onPressed: () {
                              submit_form();
                            },
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            padding: FxSpacing.xy(32, 8),
                            pressedOpacity: 0.5,
                            child: FxText.bodyMedium("Sign In",
                                color: Colors.white)),
                      ),
                      Container(height: 5),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 14),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.transparent),
                            child: Text(
                              "Reset password",
                              style: TextStyle(
                                  color: CustomTheme.primary, fontSize: 14),
                            ),
                            onPressed: () {
                              submit_form();
                            },
                          )
                        ],
                      ),
                    ],
                  ))),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
