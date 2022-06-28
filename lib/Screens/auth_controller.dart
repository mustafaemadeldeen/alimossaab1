import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maidesiter/Screens/Home.dart';
import 'package:maidesiter/Screens/login.dart';
import 'package:maidesiter/Screens/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthContreller extends GetxController{
  static AuthContreller instance = Get.find();
  late Rx<User?> _user ;
  FirebaseAuth auth = FirebaseAuth.instance ;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>( auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }
  _initialScreen (User? user){
    if (user == null){
      print('login page');
      Get.offAll(()=>Login_page());
    }else{
      Get.offAll(()=>Home());
    }
  }
  void register(String email , password)async{
  try{
   await auth.createUserWithEmailAndPassword(email: email, password: password);
     
  } catch(e){
  Get.snackbar("About User", "User message",
  backgroundColor: Colors.red,
  snackPosition: SnackPosition.BOTTOM,
  titleText: Text("Account creation failed"),
  messageText: Text(e.toString()));
  } }
  void Login(String email , password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);

    } catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()));
    } }


}