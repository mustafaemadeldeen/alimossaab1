import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ButtonBar.dart';
import 'ButtonBar.dart';
import 'package:maidesiter/Screens/signinorregister.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _value = true;
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

  @override
  Widget build(BuildContext context) {
    TextEditingController? _texteditingcontroller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.pink,
                ),
                height: 400,
                padding: EdgeInsets.only(top: 160),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                           Padding(
                             padding: EdgeInsets.only(left: 20,right: 20),
                             child:Column(children: [
                               DropdownButtonFormField(
                                
                                    dropdownColor: Colors.white,
                                 decoration: InputDecoration(


                                   border:

                                   OutlineInputBorder(

                                     
                                     borderRadius: BorderRadius.circular(30),
                                     borderSide: BorderSide(width: 3),
                                   ),
                                 ),
                                 items: _wilaya
                                     .map((String item) => DropdownMenuItem<String>(
                                     child: Text(
                                       item,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,), ), value: item))
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Radio(
                            value: true,
                            groupValue: _value,
                            onChanged: (bool? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                        Text(
                          'Baby sitter',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Radio(
                            value: false,
                            groupValue: _value,
                            onChanged: (bool? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                        Text(
                          'maide',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),

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
            ],
          )),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInOrRegister()));
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add_circle_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ButtomBar(),
    );
  }
}
