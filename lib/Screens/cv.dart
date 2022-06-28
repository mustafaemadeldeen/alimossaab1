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
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final firstName = args['firstName'];
    final lastName = args['lastName'];
    final phone = args['phone'];
    final address = args['address'];
    final job = args['job'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('cv'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(''),
          ],
        ),
      ),
    );
  }
}
