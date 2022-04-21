

import 'package:flutter/material.dart';
import 'slide.dart';









class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
    Container(

    height:300,
    width:300 ,
    decoration:  BoxDecoration(
    image: DecorationImage(
    image: AssetImage(SlideLIst[index].images),
      fit: BoxFit.cover
    )
    ),
    ),
    const SizedBox(height: 40,),
     Text(SlideLIst[index].title,style: TextStyle(fontSize: 30 ,color: Colors.white),),
    const SizedBox(height: 20,),
    Text(SlideLIst[index].description
    ,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),

    ],
    ),);

  }
}

