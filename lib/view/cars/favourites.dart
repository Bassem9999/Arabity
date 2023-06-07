import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/utils/constants.dart';



class Favlist extends StatelessWidget {
  


   const Favlist({super.key, }) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("المفضلات"),
          centerTitle: true,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var fav = cubit.favourites;
          return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: cubit.favourites.length,
                itemBuilder: (context,i){
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage("$baseUrl/images/${fav[i]['photo1']}"),fit: BoxFit.cover)
                          ),
                          ),
                          const SizedBox(width: 15,),
                          SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(fav[i]['brand'],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5,),
                                Text(fav[i]['model'],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                                const SizedBox(height: 5,),
                                Text("${fav[i]['price']} ج.م",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: const Icon(Icons.delete_outline_outlined),
                            ),
                            onTap: () {
                              cubit.deletefromLocalFav(id: fav[i]['id']);
                            },
                          ),
                          const SizedBox(width: 10,)
                      ],
                    ),
                  );
                }),
            );
        },
      )
        );
    
  }
}


