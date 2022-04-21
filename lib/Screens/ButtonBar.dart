import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maidesiter/Screens/signinorregister.dart';


class ButtomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 9,
      clipBehavior:Clip.antiAlias,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
topRight: Radius.circular(25),

            
          ),
          color: Colors.white,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 IconButton(
                   onPressed:(){  }, icon: Icon(Icons.home,color: Colors.pink,size: 35),) ,
              ],

              )
              ,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInOrRegister()));
                    }, icon: Icon(Icons.person,color: Colors.pink,size: 35),) ,
                ],

              )
              ,
            )
          ],
        ),
      ),

    );
  }
}
