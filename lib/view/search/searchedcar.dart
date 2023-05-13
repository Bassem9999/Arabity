import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/widgets/car_widget.dart';

class Searchedcar extends StatefulWidget {
  final brand;
  final model;
  final priceFrom;
  final priceTo;
  final transimition;
  final yearFrom;
  final yearTo;
  final city;

  Searchedcar(
      {this.brand,
      this.model,
      this.priceFrom,
      this.priceTo,
      this.transimition,
      this.yearFrom,
      this.yearTo,
      this.city});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Searchedcar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Cars"),
            centerTitle: true,
          ),
          body: FutureBuilder(
              future: cubit.searchForCar(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return CarWidget(
                          id: snapshot.data[i]['id'],
                          brand: snapshot.data[i]['brand'],
                          model: snapshot.data[i]['model'],
                          price: snapshot.data[i]['price'],
                          transimition: snapshot.data[i]['trans'],
                          km: snapshot.data[i]['km'],
                          year: snapshot.data[i]['year'],
                          color: snapshot.data[i]['year'],
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
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        );
      },
    );
  }
}
