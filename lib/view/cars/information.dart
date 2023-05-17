// ignore_for_file: prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:shared_preferences/shared_preferences.dart';
import 'package:arabity/components/functions.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/constants.dart';
import '../home/chat.dart';


class CarInfo extends StatelessWidget {
  final i_id;
  final i_brand;
  final i_model;
  final i_color;
  final i_price;
  final i_transimition;
  final i_km;
  final i_year;
  final i_owner;
  final i_phone;
  final i_city;
  final i_additions;
  final i_info;
  final i_photo1;
  final i_photo2;
  final i_photo3;
  final i_photo4;
  final i_photo5;
  final i_photo6;
  final i_photo7;
  final i_date;

  CarInfo({
     required this.i_id,
     required this.i_brand,
     required this.i_model,
     required this.i_color,
     required this.i_price,
     required this.i_transimition,
     required this.i_km,
     required this.i_year,
     required this.i_owner,
     required this.i_phone,
     required this.i_city,
     required this.i_additions,
     required this.i_info,
     required this.i_photo1,
     required this.i_photo2,
     required this.i_photo3,
     required this.i_photo4,
     required this.i_photo5,
     required this.i_photo6,
     required this.i_photo7,
     required this.i_date
       });

  @override
  Widget build(BuildContext context) {
  List additionsList = i_additions.split(",");
  var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Info"),
        actions: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return IconButton(
                icon: cubit.favouriteCarId.contains(i_brand)?
                      const Icon(Icons.favorite,color: Colors.red,)
                    : const Icon(Icons.favorite_border,color: Colors.white,),
                tooltip: "Add to Favourites",
                onPressed: () {
                  cubit.addToLocalFav(
                    owner: i_owner,
                    phone: i_phone, 
                    brand: i_brand, 
                    model: i_model, 
                    city: i_city, 
                    color: i_color, 
                    price: i_price, 
                    trans: i_transimition, 
                    km: i_km, 
                    year: i_year, 
                    info: i_info, 
                    photo1: i_photo1 , 
                    photo2: i_photo2 , 
                    photo3: i_photo3 , 
                    photo4: i_photo4 , 
                    photo5: i_photo5,
                     );
                },
                //color: Colors.red,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone_forwarded),
            tooltip: "Contact with the Owner",
            onPressed: () {
             showdialog(context, "Owner's Data", Container(
              height: 100,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   const Text("Owner's Data"),
                   const SizedBox(height: 20,),
                  Row(
                    children: [
                      const Text("Name : "),
                      Text(i_owner),
                    ],
                  ),
                   const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Text("Phone : "),
                      Text(i_phone),
                    ],
                  )
                ],
               ),
             ), Colors.white);
            },
            splashColor: Colors.red,
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 230,
                    child: Carousel(
                      images: [
                        if (i_photo1 != "") Image.network("$baseUrl/images/$i_photo1",fit: BoxFit.cover,),
                        if (i_photo2 != "") Image.network("$baseUrl/images/$i_photo2",fit: BoxFit.cover,),
                        if (i_photo3 != "") Image.network("$baseUrl/images/$i_photo3",fit: BoxFit.cover,),
                        if (i_photo4 != "") Image.network("$baseUrl/images/$i_photo4",fit: BoxFit.cover,),
                        if (i_photo5 != "") Image.network("$baseUrl/images/$i_photo5",fit: BoxFit.cover,),
                        if (i_photo6 != "") Image.network("$baseUrl/images/$i_photo6",fit: BoxFit.cover,),
                        if (i_photo7 != "") Image.network("$baseUrl/images/$i_photo7",fit: BoxFit.cover,),
                      ],
                    ),
                  ),

                   Container(
                    margin: const EdgeInsets.only(top: 10, right: 15),
                    child:  Text("$i_brand $i_model ",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 15),
                    child:  Text("$i_price جنيه",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.red),
                    ),
                  ),
            
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 15),
                    child: const Text("معلومات عن السيارة",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
            
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.15)),
                    child: Text(
                      i_info,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("ماركة السيارة",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_brand,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("الموديل",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_model,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("السعر",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text("$i_price",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("التعليق",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_transimition,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("الكيلومترات ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_km,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("السنة",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_year,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("اللون",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_color,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("المدينة",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_city,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                   Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        const SizedBox(width: 120,child: Text("تاريخ النشر",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                        const Spacer(),
                        Text(i_date,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 50,)
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 10),
                    child: const Text("مزايا السيارة",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    height: additionsList.length * 32,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView.builder(
                      controller: ScrollController(),
                      itemCount: additionsList.length - 1,
                      itemBuilder: (context,i){
                        return Text("${i+1} - ${additionsList[i]}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.normal),);
                      }
                      ),
                  ),
                  

                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: Table(
                  //     border: TableBorder.all(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
                  //     children: [
                  //       TableRow(
                  //         children: [
                  //           Container(
                  //             height: 20,
                  //           ),
                  //           Container(
                  //             height: 20,
                  //           ),
                  //         ]
                  //       )
                  //     ],
                  //     ),
                  // )
            
                ],
              ),
            ),
      
            SizedBox(
              height: 50,
              child: Row(children: [

                Expanded(
                  child: InkWell(
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("مراسلة",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(width: 7,),
                          Icon(Icons.chat_outlined,color: Colors.white,size: 30,),
                        ],
                      ),
                    ),
                    onTap: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      // ignore: use_build_context_synchronously
                      myPushNavigator(context, ChatPage(sendFrom: preferences.getString('phone').toString() , sendTo: i_phone,));
                      //launchUrl(Uri.parse('https://wa.me/$i_phone'));
                      
                    },
                  ),
                ),
               // SizedBox(width: 10,),
      
                Expanded(
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("اتصال ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(width: 7,),
                          Icon(Icons.phone,color: Colors.white,size: 30,),
                        ],
                      ),
                    ),
                    onTap: () {
                     launchUrl(Uri.parse('tel:$i_phone'));
                    },
                  ),
                ),
      
                
                
                
              ],),
            )
          ],
        ),
      ),
    );
  }
}
