import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maidesiter/Screens/cv.dart';
import 'package:maidesiter/Screens/user.dart';
import '../AddEditPage.dart';
import 'ButtonBar.dart';

import 'ButtonBar.dart';
import 'package:maidesiter/AddEditPage.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var _value ;
  List<String> _wilaya = [
    'Adrar',
    'Chlef',
    'Laghouat',
    'Oum El Bouaghi',
    'Batna',
    'Bejaïa',
    'Biskra',
    'Béchar',
    'Blida',
    'Bouira',
    'Tamanrasset',
    'Tebessa',
    'Tlemcen',
    'Tiaret',
    ' Tizi Ouzou',
    'Alger',
    'Djelfa',
    'Djijel',
    'Sétif ',
    ' Saïda',
    'Skikda',
    'Sidi Bel Abbès ',
    'Annaba',
    'Guelma',
    'Constantine',
    'Médéa ',
    'Mostaganem',
    'M"Sila ',
    'Mascara',
    'Ouargla',
    'Oran',
    'El Bayadh ',
    'Illizi',
    'Bordj Bou Arreridj ',
    'Boumerdès',
    'El Tarf',
    'Tindouf',
    'Tissemsilt',
    'El Oued',
    'Khenchela',
    'Souk Ahras',
    'Tipaza',
    'Mila',
    'Aïn Defla',
    'Naâma',
    'Aïn Témouchent',
    'Ghardaia',
    'Relizane',
    'El M"Ghair',
    'El Menia',
    'Ouled Djellal',
    'Bordj Baji Mokhtar',
    'Béni Abbès',
    'Timimoun',
    'Touggourt',
    'Djanet',
    'In Salah',
    'In Guezzam',
  ];
  String _selectwilaya = 'Adrar';
  //String _salutation = "";
  // String _salutation =
  //     "Mr."; //This is the selection value. It is also present in my array.
  // final _salutations = [
  //   "Mr.",
  //   "Mrs.",
  //   "Master",
  //   "Mistress"
  // ]; //This is the array for dropdown
  late String valueChoose;
  // Future getData()async{
  //   var url = 'http://192.168.1.104/php-mysql-flutter-crud/read.php';
  //   var response = await http.get(Uri.parse(url));
  //   return json.decode(response.body);
  // }
  TextEditingController? _texteditingcontroller = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  // final fb = FirebaseDatabase.instance;
  // var l;
  // var g;
  // var k;
  // final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('notes').snapshots() ;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   // final ref = fb.ref().child('todos');
List<User> allusers =[];


    return Scaffold(
      body: Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),

          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(left: 20,right: 20),
                       child:Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         DropdownButtonFormField(

                           focusColor: Colors.white,

                              dropdownColor: Colors.white,

                           decoration: InputDecoration(

                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.black, width: 1),
                               borderRadius: BorderRadius.circular(30),
                             ),


                             border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.black, width: 1),
                               borderRadius: BorderRadius.circular(30),
                             ),filled: true,
                             fillColor: Colors.white,
                           ),
                           items: _wilaya
                               .map((String item) => DropdownMenuItem<String>(
                               child: Text(
                                 item,style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal,), ), value: item))
                               .toList(),
                           onChanged: (String? value) {
                             setState(() {
                               print("previous ${this._selectwilaya}");
                               print("selected $value");
                               this._selectwilaya = value!;
                             });
                           },
                           value: _selectwilaya,
                         ),
                         SizedBox(height: 12,),
                         FlatButton(
                           color: Colors.white,
                           onPressed: (){}, child: Text('search',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(30.0),),side: BorderSide(color: Colors.black,width: 1, ),
                         ),height: 50,minWidth: 400,)
                       ],)

                  ),
                 //
                  // Container(
                  //     width: double.infinity,
                  //     margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  //     padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(50)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Container(
                  //           margin: EdgeInsets.only(left: 20),
                  //           height: 22,
                  //           width: 22,
                  //           child:const Icon(
                  //             Icons.location_on_outlined,
                  //             color: Colors.white,
                  //             size: 20,
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  // Container(
                  //     height: 50,
                  //     margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  //     padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  //     child: TextField(
                  //       onChanged: (value){
                  //         wilaya = wilaya.where((element) => element.contains(value)).toList();
                  //       },
                  //       textAlign: TextAlign.center,
                  //       controller: _texteditingcontroller,
                  //       decoration:const InputDecoration(
                  //         hintText: 'city',
                  //         focusedBorder: InputBorder.none,
                  //         border: InputBorder.none,
                  //         hintStyle: TextStyle(
                  //             color: Colors.white70
                  //         ),
                  //       ),
                  //       style: TextStyle(fontSize: 16,
                  //           color: Colors.white),
                  //     )),
                ],
              ),
        // Padding(
        //   padding: EdgeInsets.only(left: 1, right: 1),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Expanded(
        //             child:ListTile(
        //               title: const Text('Baby sitter'),
        //               leading: Radio(
        //                 fillColor: MaterialStateColor.resolveWith((states) => Color(0XFFB63728)),
        //                 value: 1,
        //                 groupValue: _value,
        //                 onChanged: ( value) {
        //                   setState(() {
        //                     _value = value;
        //                   });
        //                 },
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: ListTile(
        //
        //               title: const Text('maide'),
        //               leading: Radio(
        //                 fillColor: MaterialStateColor.resolveWith((states) => Color(0XFFB63728)),
        //                 value: 2,
        //                 groupValue: _value,
        //                 onChanged: ( value) {
        //                   setState(() {
        //                     _value = value;
        //                   });
        //                 },
        //               ),
        //             ),),
        //           Expanded(
        //             child:ListTile(
        //               title: const Text('assistant médical'),
        //               leading: Radio(
        //                 fillColor: MaterialStateColor.resolveWith((states) => Color(0XFFB63728)),
        //                 value: 3,
        //                 groupValue: _value,
        //                 onChanged: ( value) {
        //                   setState(() {
        //                     _value = value;
        //                   });
        //                 },
        //               ),
        //             ),
        //           ),
        //
        //         ],
        //       )
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                      title: const Text('Baby sitter'),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                  RadioListTile(
                      title: const Text('maide'),
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                  RadioListTile(
                      title: const Text('assistant médical'),
                      value:3,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                  // Radio (
                  //     value: 1,
                  //     groupValue: _value,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _value = 1;
                  //       });
                  //     }),
                  // Text(
                  //   'Baby sitter',
                  //   style: TextStyle(fontSize: 13, color: Colors.black),
                  // ),
                  // Radio(
                  //     value: 2,
                  //     groupValue: _value,
                  //     onChanged: ( value) {
                  //       setState(() {
                  //         _value = 1;
                  //       });
                  //     }),
                  // Text(
                  //   'maide',
                  //   style: TextStyle(fontSize:13, color: Colors.black),
                  // ),
                  // Radio(
                  //     value: 3,
                  //     groupValue: _value,
                  //     onChanged: ( value) {
                  //       setState(() {
                  //         _value = 1;
                  //       });
                  //     }),
                  // Text(
                  //   'assistant médical',
                  //   style: TextStyle(fontSize: 13, color: Colors.black),)
                ],
              )
            ],
          ),
        ),
    // StreamBuilder(
    //     stream: _userStream,
    //     builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
    //       if(snapshot.hasError){
    //         return Text('something is wrong');}
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         )   ;       }
    //       return Container(
    //           decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //       ),
    //       child: ListView.builder(
    // itemCount: snapshot.data!.docs.length,
    // itemBuilder: (_, index) { return GestureDetector(
    //   onTap: () {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (_) =>
    //             AddEditPage(docid: snapshot.data!.docs[index]),
    //       ),
    //     );
    //   },
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 4,
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(
    //           left: 3,
    //           right: 3,
    //         ),
    //         child: ListTile(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             side: BorderSide(
    //               color: Colors.black,
    //             ),
    //           ),
    //           title: Text(
    //             snapshot.data!.docChanges[index].doc['title'],
    //             style: TextStyle(
    //               fontSize: 20,
    //             ),
    //           ),
    //           subtitle: Text(
    //             snapshot.data!.docChanges[index].doc['content'],
    //             style: TextStyle(
    //               fontSize: 15,
    //             ),
    //           ),
    //           contentPadding: EdgeInsets.symmetric(
    //             vertical: 12,
    //             horizontal: 16,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    // },
    //       )
    //       );
    //     } )
    //
         StreamBuilder<QuerySnapshot>(
       stream: FirebaseFirestore.instance.collection('users').orderBy('firstName').snapshots(),
       builder: (context ,AsyncSnapshot<QuerySnapshot>  snp){
         if(snp.hasError){
           return Center(child: Text('Errors'),);
         }
         if(snp.hasData){
           allusers = snp.data!.docs.map((doc) => User.FromJson(doc.data() as Map<String,dynamic>)).toList();
           return SizedBox(
             height: 340,
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: allusers.length,
               itemBuilder:(context , index){
                 return Card(
                   child: ListTile(
                     title: Text(allusers[index].firstName!,style: TextStyle(fontSize: 23),),
                    // subtitle: Text(allusers[index].lastName!,style: TextStyle(fontSize: 13)),
                     trailing: TextButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder:(_)=>cv(),),);
                       },
                       child: Icon(Icons.navigate_next),
                     ),
                   ),
                 );
               } ,),
           );
         }else{return CircularProgressIndicator();}
       })

    //           FirebaseAnimatedList(
    //             shrinkWrap: true,
    // query: ref,
    // scrollDirection: Axis.vertical,
    // itemBuilder: (context, snapshot, animation, index) {
    // var v =
    // snapshot.value.toString(); // {subtitle: webfun, title: subscribe}
    //
    // g = v.replaceAll(
    // RegExp("{|}|subtitle: |title: "), ""); // webfun, subscribe
    // g.trim();
    //
    // l = g.split(','); // [webfun,  subscribe}]
    //
    // return GestureDetector(
    // onTap: () {
    // setState(() {
    // k = snapshot.key;
    // });
    //
    // showDialog(
    // context: context,
    // builder: (ctx) => AlertDialog(
    // title: Container(
    // decoration: BoxDecoration(border: Border.all()),
    // child: TextField(
    // controller: firstName,
    // textAlign: TextAlign.center,
    // decoration: InputDecoration(
    // hintText: 'title',
    // ),
    // ),
    // ),
    // content: Container(
    // decoration: BoxDecoration(border: Border.all()),
    // child: TextField(
    // controller: lastName,
    // textAlign: TextAlign.center,
    // decoration: InputDecoration(
    // hintText: 'sub title',
    // ),
    // ),
    // ),
    // actions: <Widget>[
    // MaterialButton(
    // onPressed: () {
    // Navigator.of(ctx).pop();
    // },
    // color: Color.fromARGB(255, 0, 22, 145),
    // child: Text(
    // "Cancel",
    // style: TextStyle(
    // color: Colors.white,
    // ),
    // ),
    // ),
    // MaterialButton(
    // onPressed: () async {
    // await upd();
    // Navigator.of(ctx).pop();
    // },
    // color: Color.fromARGB(255, 0, 22, 145),
    // child: Text(
    // "Update",
    // style: TextStyle(
    // color: Colors.white,
    // ),
    // ),
    // ),
    // ],
    // ),
    // );
    // },
    // child: Container(
    // child: Padding(
    // padding: const EdgeInsets.all(8.0),
    // child: ListTile(
    // shape: RoundedRectangleBorder(
    // side: BorderSide(
    // color: Colors.white,
    // ),
    // borderRadius: BorderRadius.circular(10),
    // ),
    // tileColor: Colors.indigo[100],
    // trailing: IconButton(
    // icon: Icon(
    // Icons.delete,
    // color: Color.fromARGB(255, 255, 0, 0),
    // ),
    // onPressed: () {
    // ref.child(snapshot.key!).remove();
    // },
    // ),
    // title: Text(
    // l[1],
    // // 'dd',
    // style: TextStyle(
    // fontSize: 25,
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    // subtitle: Text(
    // l[0],
    // // 'dd',
    //
    // style: TextStyle(
    // fontSize: 25,
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    // ),
    // ),
    // ),
    // );
    // },
    //
    // )
    //
    //


      // ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     itemCount: wilaya.length,
        //     itemBuilder: (context ,index){
        //       return Padding(padding:
        //       EdgeInsets.all(4),
        //         child: Column(
        //
        //           children: [
        //
        //             Text(wilaya[index].toString()),
        //
        //
        //           ],
        //         ),);
        //     }),
        // FutureBuilder(
        //   future: getData(),
        //
        //   builder: (context,snapshot){
        //     if(snapshot.hasError) print(snapshot.error);
        //
        //     return snapshot.hasData
        //         ? ListView.builder(
        //         itemExtent: 80,
        //       //  itemCount: snapshot.data!.length,
        //
        //         itemBuilder: (context,index){
        //           Object? list = snapshot.data;
        //           return ListTile(
        //             leading: GestureDetector(child: Icon(Icons.edit),
        //               onTap: (){
        //                 Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
        //                 debugPrint('Edit Clicked');
        //               },),
        //              //title: Text(list[index]['lastname']),
        //             // subtitle: Text(list[index]['phone']),
        //             trailing: GestureDetector(child: Icon(Icons.delete),
        //               onTap: (){
        //                 setState(() {
        //                   var url = 'http://192.168.1.104/php-mysql-flutter-crud/delete.php';
        //                   http.post(Uri.parse(url),body: {
        //                   //  'id' : list[index]['id'],
        //                   });
        //                 });
        //                 debugPrint('delete Clicked');
        //               },),
        //           );
        //         }
        //     )
        //         : CircularProgressIndicator();
        //   },
        // ),
        //   ],
        ]  ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
          debugPrint('Clicked FloatingActionButton Button');
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => DataTableDemo()));
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add_circle_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ButtomBar(),
    );
  }

//   upd()async {
//     DatabaseReference ref1 = FirebaseDatabase.instance.ref("todos/$k");
//
// // Only update the name, leave the age and address!
//     await ref1.update({
//       "title": firstName.text,
//       "subtitle": lastName.text,
//     });
//     firstName.clear();
//     lastName.clear();
//   }

}
Future  addUser(User user)async{
final docUser = FirebaseFirestore.instance.collection("users").doc();
user.id = docUser.id;
await docUser.set(user.toJson());
}