import 'package:arabity/components/widgets/car_widget.dart';
import 'package:arabity/components/widgets/drawer_widget.dart';
import 'package:arabity/model/cars_model.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class CarsList extends StatelessWidget {

   const CarsList({super.key}) ;

  @override
  Widget build(BuildContext context) {
    var cabit = AppCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("السيارات"),
            centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
          future: cabit.getCarsList(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
               return ListView.builder( itemCount: snapshot.data.length, itemBuilder:(context,i){
                CarsModel carsModel = CarsModel.fromJson(snapshot.data[i]);
               return CarItem(
                id: carsModel.id,
                brand: carsModel.brand,
                model: carsModel.model,
                color: carsModel.color, 
                price: carsModel.price,
                transimition: carsModel.transimition,
                km: carsModel.km,
                year: carsModel.year,
                name: carsModel.name,
                phone: carsModel.phone,
                ownerId: carsModel.ownerId,
                city: carsModel.city,
                additions: carsModel.additions,
                info: carsModel.info,
                photo1: carsModel.photo1,
                photo2: carsModel.photo2,
                photo3: carsModel.photo3,
                photo4: carsModel.photo4,
                photo5: carsModel.photo5,
                photo6: carsModel.photo6,
                photo7: carsModel.photo7,
                date: carsModel.date,
              );
            });
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }       
          }
          )
          ),
    );
    
  }
}

 
 