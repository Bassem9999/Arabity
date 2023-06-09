import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../auth/login.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tips extends StatefulWidget {
  

  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(pages: [
        PageViewModel(
          title: " Welcom to My Car App",
          body: "Here you can find your Dream Car , Also you can sell Your Car on Our App ",
          image: Image.asset("assets/images/caricon1.png",scale: 2,),

          decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              bodyTextStyle:  TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
             imagePadding: EdgeInsets.only(top: 50),
              pageColor: Colors.white
          )
        ),

         PageViewModel(
          title: "Sell your Car",
          body: "You can sell your Car by Uploading it on our App and let many of our visitors see it",
          image: Image.asset("assets/images/caricon3.png",scale: 1,),
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              bodyTextStyle:  TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
              imagePadding: EdgeInsets.only(top: 50),
              pageColor: Colors.white
          )
        ),

         PageViewModel(
          title: "Login or Create Account",
          body: "Create Account if you don't have One and search your favourite car from Many Cars on our App",
          image: Image.asset("assets/images/caricon2.png",scale: 1.9),
          footer: ElevatedButton(child: Text("Get Started"),onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){return Login();}));
          },),
         decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              bodyTextStyle:  TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
              pageColor: Colors.white
          )
        ),
      ],
      done: Text("next"),
       onDone: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context){return Login();}));
       }, 
       
       showSkipButton: true,
       skip: Text("Skip"),
       next: Icon(Icons.arrow_forward),
       dotsDecorator: DotsDecorator(
         color: Colors.black26,
         size: Size(10,10),
         activeSize: Size(15, 15),
         activeShape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20)
         ),
       ),
       globalBackgroundColor: Colors.blue,
       animationDuration: 800,
       
       ),
    );
  }
}