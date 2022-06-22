import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maidesiter/AddEditPage.dart';
import 'package:maidesiter/Screens/auth_controller.dart';
import 'package:maidesiter/widgets/DataTableMySqlDemo/DataTableDemo.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Screens/Home.dart';
import 'Screens/onboarding.dart';

// new

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthContreller()));
  SharedPreferences prefs= await SharedPreferences.getInstance();
  final bool? look = prefs.getBool( 'look');
  Widget _Screen ;
  if(look == null ||look == false){
    _Screen = onboarding();
  }else{
    _Screen = Home( );
  }
  runApp( MyApp(_Screen));
}
class MyApp extends StatelessWidget {
  final Widget _Screen;

  MyApp(this._Screen);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: this._Screen,
      getPages: [
        GetPage(name: "/AddEditPage", page: ()=>AddEditPage()
            ),
    GetPage(name: "/Home", page: ()=>Home())
      ],
    );
  }
}

