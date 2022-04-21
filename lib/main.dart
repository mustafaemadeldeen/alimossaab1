import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Screens/Home.dart';
import 'Screens/onboarding.dart';

// new

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs= await SharedPreferences.getInstance();
  final bool? look = prefs.getBool( 'look');
  Widget _Screen ;
  if(look == null ||look == false){
    _Screen = onboarding();
  }else{
    _Screen = Home();
  }
  runApp( MyApp(_Screen));
}
class MyApp extends StatelessWidget {
  final Widget _Screen;

  MyApp(this._Screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: this._Screen,
    );
  }
}

