
import 'package:arabity/components/functions.dart';
import 'package:arabity/view/presentation/logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/auth/login.dart';
import '../../view/home.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.withOpacity(0.5),
      child: ListView(children: <Widget>[ 
        UserAccountsDrawerHeader(
         accountName: Text(""),
         accountEmail: Text(""),  

         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/images/caricon2.png",),fit: BoxFit.cover,opacity: 0.7,scale: 10)
         ),
         ),
        ListTile( 
          leading: Icon(Icons.home,color: Colors.white,),
          title: Text("الصفحة الرئيسية",style: TextStyle(color: Colors.white,fontSize: 20),),
          onTap: (){
            myReplaceNavigator(context, const Home());
          },
        ),

        ListTile(
          leading: Icon(Icons.car_rental,color: Colors.white),
          title: Text("السيارات",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
         //   Navigator.of(context).push(MaterialPageRoute(builder: (context){return List(l_email: d_email,);}));
          },
        ),

        ListTile(
          leading: Icon(Icons.favorite_border,color: Colors.white),
          title: Text("المفضلات",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return Favlist(f_email: d_email,);}));
          },
        ),

        ListTile(
          leading: Icon(Icons.contact_phone_outlined,color: Colors.white),
          title: Text("المطور",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
            myPushNavigator(context,const LogoDesign());
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return Developer();}));
          },
        ),

        ListTile(
          leading: Icon(Icons.logout,color: Colors.white),
          title: Text("تسجيل خروج",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.remove('phone');
            myPushNavigator(context,const Login());
            print(preferences.getString('phone'));
            
          },
        ),


      ],),
    );
  }
}