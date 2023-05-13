import 'package:arabity/components/widgets/car_widget.dart';
import 'package:arabity/components/widgets/drawer_widget.dart';
import 'package:arabity/repositories/cars_repo.dart';
import 'package:flutter/material.dart';

class CarsList extends StatelessWidget {

   const CarsList({super.key}) ;

  @override
  Widget build(BuildContext context) {
    CarsRepo carsRepo = CarsRepo();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("السيارات"),
            centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
          future:carsRepo.fetchCarsResponse(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
               return ListView.builder( itemCount: snapshot.data.length, itemBuilder:(context,i){
              return CarWidget(
                id: snapshot.data[i]['id'],
                brand: snapshot.data[i]['brand'],
                model: snapshot.data[i]['model'],
                color: snapshot.data[i]['color'],
                price: snapshot.data[i]['price'],
                transimition: snapshot.data[i]['trans'],
                km: snapshot.data[i]['km'],
                year: snapshot.data[i]['year'],
                name: snapshot.data[i]['owner'],
                phone: snapshot.data[i]['phone'],
                city: snapshot.data[i]['city'],
                additions: snapshot.data[i]['additions'],
                info: snapshot.data[i]['info'],
                photo1: snapshot.data[i]['photo1'],
                photo2: snapshot.data[i]['photo2'],
                photo3: snapshot.data[i]['photo3'],
                photo4: snapshot.data[i]['photo4'],
                photo5: snapshot.data[i]['photo5'],
                photo6: snapshot.data[i]['photo6'],
                photo7: snapshot.data[i]['photo7'],
                date: snapshot.data[i]['date'],
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

 
 