import 'package:arabity/components/widgets/drawer_widget.dart';
import 'package:arabity/view/cars/add.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/utils/constants.dart';
import '../../components/widgets/home_widget.dart';
import '../cars/cars.dart';
import '../cars/favourites.dart';
import '../search/search.dart';
import 'prices.dart';

//import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    var cubit = AppCubit.get(context);
    cubit.fcmConfig(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                title: const Text("الصفحة الرئيسية"),
                centerTitle: true,
              ),
              drawer: const MyDrawer(),
              // floatingActionButton: FloatingActionButton(onPressed: ()async{
              //   await FirebaseMessaging.instance.getToken().then((value) {
              //     print(value);
              //   });
              // }),
              body: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: const BoxDecoration(image: appBgImage),
                  child: Column(
                    children: [
                       SizedBox(height: 10,),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: HomeWidget(
                                    text: "البحث عن سيارة",
                                    icon: Icons.car_rental,
                                    destination: const CarsList())),
                            Expanded(
                                child: HomeWidget(
                                    text: "اضف سيارتك",
                                    icon: Icons.add_circle_outline_rounded,
                                    destination: const Addcar())),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: HomeWidget(
                                    text: "بحث متقدم",
                                    icon: Icons.search,
                                    destination: Search())),
                            Expanded(
                                child: HomeWidget(
                                    text: "ورش السيارات",
                                    icon: Icons.car_repair_outlined,
                                    destination: const Addcar())),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: HomeWidget(
                                    text: "المفضلات",
                                    icon: Icons.favorite_outline_outlined,
                                    destination: const Favlist())),
                            Expanded(
                                child: HomeWidget(
                                    text: "اسعار السيارات",
                                    icon: Icons.price_check,
                                    destination: const Prices())),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ))),
        );
      },
    );
  }
}
