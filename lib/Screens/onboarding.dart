import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:maidesiter/Screens/signinorregister.dart';
import 'package:maidesiter/Screens/slide.dart';
import 'package:maidesiter/Screens/slideItem.dart';

import 'package:shared_preferences/shared_preferences.dart';


class onboarding extends StatefulWidget {


  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentpage = 0 ;
  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for( int i=0 ; i< SlideLIst.length ; i++){
      list.add(i ==_currentpage ? SlideDots(true) : SlideDots(false));
    }
    return list;
  }
  Widget SlideDots(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin:const EdgeInsets.symmetric(horizontal: 10),
      height: isActive? 12:8,
      width: isActive? 12:8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),

      ),

      
    );
  }

  _onPageChanged(int index){
    setState(() {
      _currentpage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        decoration:const BoxDecoration(
          gradient : LinearGradient(
            colors: [
              Colors.pink,
              Colors.pinkAccent,


            ]
          )
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 500,
                  child: PageView.builder(
                    onPageChanged: _onPageChanged,
                    controller: _pageController,
                      itemCount: SlideLIst.length,
                      itemBuilder: (context, index) => SlideItem(index)),
                )
              ],
            ),
            SizedBox(height: 130),
            Container(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildPageIndicator(),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentpage < 1?
                  FlatButton(
                      onPressed: (){
                    _pageController.animateToPage(SlideLIst.length -1, duration: Duration(milliseconds: 10), curve: Curves.easeIn );
                  }, child: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 22,),)):
                  SizedBox(),
                  _currentpage !=3?

                  FlatButton(onPressed: (){
                    _pageController.nextPage(duration: Duration(
                      milliseconds: 300
                    ),curve: Curves.easeIn );
                  }, child:Row(
                    children: const[
                    Text('Next',style: TextStyle(color: Colors.white,fontSize: 22,),),
                      SizedBox(height: 10,),
                      Icon(Icons.arrow_forward,color: Colors.white,size: 30,),

                    ],
                  ) ):

                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      _updateSeen();
                      return Home();}));
                  }, child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 22,),)),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  void _updateSeen()async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setBool('look', true);

  }
}
