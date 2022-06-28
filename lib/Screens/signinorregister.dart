
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maidesiter/Screens/Home.dart';
import 'login.dart';
import 'register.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignInOrRegister extends StatefulWidget {
  @override
  _SignInOrRegisterState createState() => _SignInOrRegisterState();
}

class _SignInOrRegisterState extends State<SignInOrRegister> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  Map<String, dynamic>? _userData;
  String welcome = "Facebook";
  String userEmail = "";

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            //TODO update background image according to your brand
            'images/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.1),
                    ])),
          ),
          Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 29.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      // Text(
                      //   //TODO update this
                      //   'Join Mr BookWorm!',
                      //   style: TextStyle(
                      //     fontSize: 16.0,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: () {
                          final snackbar = SnackBar(
                            content: Text('Please try email login'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                Scaffold.of(context).hideCurrentSnackBar();
                              },
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackbar);
                        },
                        child: RaisedButton(
                          color: Colors.transparent,
                          onPressed:   () async {
                      await signInWithGoogle();},
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        height: 22,
                                        width: 22,
                                        child: Image.asset(
                                            'images/google_logo.png'),
                                      ),
                                    ],
                                  )),
                              Container(

                                height: 50,
                                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Center(
                                    child: Text(
                                      'Google',
                                      style: TextStyle(fontSize: 16),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      InkWell(
                        onTap: () {
                          final snackbar = SnackBar(
                            content: Text('Please try email login'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                Scaffold.of(context).hideCurrentSnackBar();
                              },
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackbar);
                        },
                        child: RaisedButton(
                          focusColor: Colors.transparent,
                         onPressed: ()async{
                          _logInWithFacebook();
                          },
color: Colors.transparent
                          ,                          child: Stack(
                            children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3B5998),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        height: 22,
                                        width: 22,
                                        child: Image.asset(
                                            'images/facebook_logo.png'),
                                      ),
                                    ],
                                  )),
                              Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: const Center(
                                    child: Text(
                                      'Facebook',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Login_page()),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: const Center(
                            child: Text(
                              "Don't have an account",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: const Center(
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }

//   void signInWithGoogle() async{
//    GoogleSignInAccount? googleSignInAccount  =await _googleSignIn.signIn() ;
//    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
//   AuthCredential authCredential = GoogleAuthProvider.credential(idToken:googleSignInAuthentication?.idToken ,accessToken: googleSignInAuthentication?.accessToken);
//   var  authResult = await _auth.signInWithCredential(authCredential);
//   var user = authResult.user ;
//   print('user email = ${user?.email}');
//   }
// }
  signInWithGoogle()async{
    GoogleSignInAccount? googleSignInAccount  =await _googleSignIn.signIn() ;
    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(idToken:googleSignInAuthentication?.idToken ,accessToken: googleSignInAuthentication?.accessToken);
    var authResult = await _auth.signInWithCredential(authCredential);
    var user = authResult.user ;
    print('user email = ${user?.email}');
  }
  var loading = false ;
  void _logInWithFacebook() async{
    setState(() {
      loading = true;
    });
    try{
      final facebooklLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(facebooklLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl':userData['picture']['data']['url'],
        'name':userData['name']
      });
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Home()), (route) => false);

    }on FirebaseAuthException catch (e){
      var content ='';
      switch (e.code){
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalide credential':
          content = 'Unknown error has occurred';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled ';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found ';
          break;
      }
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text('Log in with facebook faild'),
        content: Text(content),
        actions: [TextButton(onPressed: (){}, child: Text('OK'))],
      ));
    }finally{
      setState(() {
        loading = false;
      });
    }
  }

 // Future <UserCredential?> signInFacebook()async {
 //   final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);
 //    if (result.status == LoginStatus.success) {
 //
 //      final userData = await FacebookAuth.instance.getUserData();
 //
 //      _userData = userData;
 //    } else {
 //      print(result.message);
 //    }
 //
 //    setState(() {
 //      welcome = _userData?['email'];
 //    });
 //
 //
 //    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
 //
 //    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
 //
 // }
//   Future<UserCredential> signInWithFacebook() async {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login(
//         permissions: ['email', 'public_profile', 'user_birthday']
//     );
//
//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//     final userData = await FacebookAuth.instance.getUserData();
//
//     userEmail = userData['email'];
//
//     // Once signed in, return the UserCredential
//     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   }
// }
}
