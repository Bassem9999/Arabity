
import 'package:arabity/data/user_data.dart';
import 'package:arabity/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/chatting/mychats.dart';
import '../../view/home/home.dart';
import '../utils/functions.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Drawer(
      backgroundColor: Colors.blue.withOpacity(0.55),
      child: ListView(children: <Widget>[ 
        const UserAccountsDrawerHeader(
         accountName: Text(""),
         accountEmail: Text(""),  

         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/images/caricon2.png",),fit: BoxFit.cover,opacity: 0.7,scale: 10)
         ),
         ),
        ListTile( 
          leading: const Icon(Icons.home,color: Colors.white,),
          title: const Text("الصفحة الرئيسية",style: TextStyle(color: Colors.white,fontSize: 20),),
          onTap: (){
            myReplaceNavigator(context, const Home());
          },
        ),

        ListTile(
          leading: const Icon(Icons.car_rental,color: Colors.white),
          title: const Text("السيارات",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
         //   Navigator.of(context).push(MaterialPageRoute(builder: (context){return List(l_email: d_email,);}));
          },
        ),

        ListTile(
          leading: const Icon(Icons.favorite_border,color: Colors.white),
          title: const Text("المفضلات",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
            print(UserData.userEmail);
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return Favlist(f_email: d_email,);}));
          },
        ),

        ListTile(
          leading: const Icon(Icons.chat_outlined,color: Colors.white),
          title: const Text("المحادثات",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: ()async{
            SharedPreferences preferences = await SharedPreferences.getInstance();
          myPushNavigator(context, ChatsList(sendFrom: preferences.getString('phone').toString(),sendTo: "",recieverId: "",));
          },
        ),

        ListTile(
          leading: const Icon(Icons.contact_phone_outlined,color: Colors.white),
          title: const Text("المطور",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: (){
           // myPushNavigator(context,const LogoDesign());
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return Developer();}));
          },
        ),

        ListTile(
          leading: const Icon(Icons.logout,color: Colors.white),
          title: const Text("تسجيل خروج",style: TextStyle(color: Colors.white,fontSize: 20)),
          onTap: () {
           cubit.logout(context);
          },
        ),


      ],),
    );
  }
}