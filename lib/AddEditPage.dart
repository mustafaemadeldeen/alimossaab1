import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maidesiter/Screens/Home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:maidesiter/Screens/user.dart';
class AddEditPage extends StatefulWidget {

  //   final List list;
  //    final int index;
  //
  // const AddEditPage({Key? key, required this.list, required this.index}) : super(key: key);
//  AddEditPage({required this.list,required this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController job = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');
  bool editMode = false;
  final fb = FirebaseDatabase.instance;

  // addUpdateData(){
  //   if(editMode){
  //     var url = 'http://192.168.1.104/php-mysql-flutter-crud/edit.php';
  //     http.post(Uri.parse(url),body: {
  //       'fistname' : firstName.text,
  //    //   'id' : widget.list[widget.index]['id'],
  //       'lastname' : lastName.text,
  //       'phone' : phone.text,
  //       'address' : address.text,
  //     });
  //   }else{
  //     var url = 'http://192.168.1.104/php-mysql-flutter-crud/add.php';
  //     http.post(Uri.parse(url),body: {
  //       'fistname' : firstName.text,
  //       'lastname' : lastName.text,
  //       'phone' : phone.text,
  //       'address' : address.text,
  //     });
  //   }
  //
  // }


  @override
  void initState() {
   // super.initState();
    // if(widget.index != null){
    //   editMode = true;
    //   firstName.text = widget.list[widget.index]['fistname'];
    //   lastName.text = widget.list[widget.index]['lastname'];
    //   phone.text = widget.list[widget.index]['phone'];
    //   address.text = widget.list[widget.index]['address'];
    // }

  }


  @override
  Widget build(BuildContext context) {
    // var rng = Random();
    // var k = rng.nextInt(10000);
    //
    // final ref = fb.ref().child('todos/$k');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(editMode ? 'Update' :'Add Data'),),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstName,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'First Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: lastName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Last Name',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: phone,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pink),
                ),
                labelText: 'Phone',

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: address,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Address',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: job,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'job',
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: RaisedButton(

              onPressed: (){

                final user = User(firstName: firstName.text, lastName: lastName.text, phone:int.parse(phone.text) , address: address.text, job: job.text);
                firstName.text='';
                lastName.text='';
                phone.text='';
                address.text='';
                job.text='';
                addUser(user);Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=>Home(),),).whenComplete(() =>
                    {firstName.clear(),
                      lastName.clear(),
                      phone.clear(),
                      address.clear()});
                    debugPrint('Clicked RaisedButton Button');

                // setState(() {
                // ref.set({"title":firstName.text,
                // "subtitle":lastName.text}).asStream();Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=>Home(),),).whenComplete(() =>
                // {firstName.clear(),
                //   lastName.clear(),
                //   phone.clear(),
                //   address.clear()});
                // debugPrint('Clicked RaisedButton Button');
                // });
               // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),),)
              },

              color: Colors.pink,
              child: Text(editMode ? 'Update' :'Save',style: TextStyle(color: Colors.white,),),
            ),
          ),
        ],
      ),
    );
  }
}
