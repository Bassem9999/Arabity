
import 'package:flutter/material.dart';

import '../../view/cars/information.dart';
import '../utils/constants.dart';
import '../utils/functions.dart';

class CarItem extends StatelessWidget {
  final id;
  final brand;
  final model;
  final color;
  final price;
  final transimition;
  final km;
  final year;
  final ownerId;
  final name;
  final phone;
  final city;
  final additions;
  final info;
  final photo1;
  final photo2;
  final photo3;
  final photo4;
  final photo5;
  final photo6;
  final photo7;
  final date;
  

  
  CarItem({
   required this.id,
   required this.model,
   required this.brand,
   required this.color,
   required this.price,
   required this.transimition,
   required this.km,
   required this.year,
   required this.name,
   required this.phone,
   required this.ownerId,
   required this.city,
   required this.additions,
   required this.info,
   required this.photo1,
   required this.photo2,
   required this.photo3,
   required this.photo4,
   required this.photo5,
   required this.photo6,
   required this.photo7,
   required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: NetworkImage("$baseUrl/images/$photo1"),fit: BoxFit.cover)
                            ),
                            ),
                            const SizedBox(width: 15,),
                            SizedBox(
                              width: 130,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(brand,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 3,),
                                  Text(model,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                                  const SizedBox(height: 3,),
                                  Text("$price  ج.م",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                  Text("$date",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
       onTap: (){
              myPushNavigator(context, CarInfo(
                i_id:id,
                i_brand:brand,
                i_model:model,
                i_color:color,
                i_price:price,
                i_transimition:transimition,
                i_km:km , 
                i_year:year,
                i_ownerId:ownerId,
                i_owner:name,
                i_phone:phone,
                i_city:city,
                i_additions: additions,
                i_info:info,
                i_photo1:photo1,
                i_photo2:photo2,
                i_photo3:photo3,
                i_photo4:photo4,
                i_photo5:photo5,
                i_photo6:photo6,
                i_photo7:photo7,
                i_date : date
                ));
                     
                  },
    );
  }
} 
  