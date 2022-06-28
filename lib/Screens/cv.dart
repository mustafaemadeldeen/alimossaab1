import 'package:flutter/material.dart';
import 'package:maidesiter/Screens/user.dart';

class cv extends StatefulWidget {
  const cv({Key? key}) : super(key: key);

  @override
  State<cv> createState() => _cvState();
}

class _cvState extends State<cv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('cv'),
        backgroundColor: Colors.pink,
      ),
      body: Container(

      ),
    );
    
  }
}
