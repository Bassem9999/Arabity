
import 'package:arabity/components/widgets/drawer_widget.dart';
import 'package:arabity/view/search.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/widgets/home_widget.dart';
import 'add.dart';
import 'cars.dart';
import 'favourites.dart';
import 'prices.dart';

//import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatelessWidget {

   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
        title: const Text("الصفحة الرئيسية"),
        centerTitle: true,
        ),
        drawer: const MyDrawer(),
        //floatingActionButton: FloatingActionButton(onPressed: (){carsRepo.fetchCarsResponse();}),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
          decoration: const BoxDecoration(
            image: appBgImage
          ),
          
            child : Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                     Expanded(child: HomeWidget(text: "البحث عن سيارة", icon: Icons.car_rental, destination: const CarsList())),
                     Expanded(child: HomeWidget(text: "اضف سيارتك", icon: Icons.add_circle_outline_rounded, destination: const Addcar())),
                    ],
                  ),
                ),
    
                Expanded(
                  child: Row(
                    children: [
                     Expanded(child: HomeWidget(text: "بحث متقدم", icon: Icons.search, destination: Search())),
                     Expanded(child: HomeWidget(text: "ورش السيارات", icon: Icons.car_repair_outlined, destination: const Addcar())),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                     Expanded(child: HomeWidget(text: "المفضلات", icon: Icons.favorite_outline_outlined, destination: const Favlist())),
                     Expanded(child: HomeWidget(text: "اسعار السيارات", icon: Icons.price_check, destination: const Prices())),
                    ],
                  ),
                ) 
              ],
            )
    
        )
      
      ),
    );
    
    
  }
}