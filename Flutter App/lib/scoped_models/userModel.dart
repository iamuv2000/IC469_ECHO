import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'package:parallax/scoped_models/shared.dart';
import 'package:parallax/models/user.dart';
import 'package:parallax/scoped_models/urls.dart';

mixin UserModel on Model{
  // Future<dynamic> logIn(String uid, String name) async {
  Future<dynamic> logIn(User user) async {
   var statuscode;
   var message;
  //  var body;
   var body=json.encode({
      "uid": user.uid,
      "name": user.name,
      "email": user.email
   });
  //  print("BOdy1");
  //  print(body);
   try{
      print("Sending Log In Request!");
      // print(body);
      http.Response response=await http.post(
          url_register,
          headers: {"Content-type": "application/json"},
          body: body
      );
      print("Response LogIn:");
      print(response.statusCode);
      print(response.body);
      statuscode=response.statusCode;
      if(response.statusCode==200)
       {
        //  print("User:");
        //  print(user.uid);
        Shared.setUserData(user);
        return jsonDecode(response.body);
      }
      else{
        if(response.statusCode==500 || response.statusCode==400 || response.statusCode==404)
          {
            throw "Server Error!";
          }
        else{
          print("This wala error!");
          message=jsonDecode(response.body)["message"];
          throw message;
        }
      }
   }
  catch(err){
    print("Error Logging In!....$err");
    return {
      "code": statuscode,
      "message": err
    };
  }
 }
}