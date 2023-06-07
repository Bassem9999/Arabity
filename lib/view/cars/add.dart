import 'dart:io';
import 'package:arabity/components/widgets/textfield_widget.dart';
import 'package:arabity/view_model/app_cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../components/utils/controllers.dart';
import '../../components/utils/functions.dart';

class Addcar extends StatefulWidget {
  const Addcar({Key? key}) : super(key: key);

  @override
  _AddcarState createState() => _AddcarState();
}

class _AddcarState extends State<Addcar> {


  var cities = [
    "Cairo",
    "Alexandria",
    "Al-Sharkia",
    "Aswan",
    "Luxor",
    "Al-Minoufia",
    "Al-Garbia",
    "Dakahlia",
    "North Sainai",
    "South Sainia",
    "PortSaid",
    "Dumait",
    "Ismailia",
    "Suiz",
    "Al-Minia",
    "Al-Qalubia",
    "Asuit",
    "Al-Fayoum",
    "Giza",
    "Hurgaida",
    "Kafr Al-Sheikh",
    "Al-Bahr Al-Ahmar",
  ];
  

  // List<String?> brands = [
  //   "Mercides",
  //   "BMW",
  //   "Ferrari",
  //   "Hundai",
  //   "Toyota",
  //   "Audi",
  //   "Dodge",
  //   "Peigout",
  //   "Lamburgini",
  //   "Geely",
  //   "BYD",
  //   "Pugatti",
  //   "Honda",
  //   "Jeep",
  //   "Chevorlet",
  //   "Ford",
  //   "KIA",
  //   "Fiat",
  //   "Suzouki",
  //   "Nissan",
  //   "Sang yong",
  //   "Skoda",
  //   "Lada",
  //   "Mazda",
  //   "Mitsubishu",
  //   "Obel",
  //   "Rino",
  //   "Jaguar",
  //   "Volkes wagn",
  //   "Subarou",
  //   "Alpha Romeo",
  //   "Siat",
  //   "Land Rover",
  //   "Jac",
  //   "Isuzu",
  //   "MG",
  //   "Mini",
  //   "Sheri",
  //   "Pourch",
  //   "Maziratti",
  //   "Aston Martin",
  //   "Volvo"
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("اضف سيارة"),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: formstateAddCar,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                      child: const Text(
                        "بيانات اضافة سيارة",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                   cubit.images_files.isEmpty?  
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 5),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.camera_alt_outlined,size: 100,color: Colors.grey,))

                     : SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.images_files.length,
                          itemBuilder: (context,i){
                          return Container(
                            width: 120,
                            margin: const EdgeInsets.all(10),
                            child: Image.file(File(cubit.images_files[i]!.path),fit:BoxFit.cover ,));
                        }),
                      ),  

                      const SizedBox(height: 10,),

                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(onPressed: (){ cubit.pickimages(context); }, child: const Text("اضافة صور")),
                    ),


                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: const Text("البيانات الشخصية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue))),

                    UnroundedTextFieldWidget(label: "الاسم", mycontroller: carOwnername, myval: myvalEmail, isPassword: false),
                    UnroundedTextFieldWidget(label: "رقم التواصل", mycontroller: carOwnerPhone, myval: myvalEmail, isPassword: false),
                    
                    Container(
                        margin: const EdgeInsets.only(right: 20, bottom: 30),
                        child: const Text("المدينة", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                    
                     Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(
                        value: city,
                        items: cities.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                        hint: const Text("المدينة"),
                        isExpanded: true,
                        onChanged: (item){setState(() {
                          city = item;
                          print("$city $transimition $brand");
                        });}),
                    ),    
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 20),
                      child: const Text("بيانات السيارة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue))),
                   
                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 30),
                        child: const Text("ماركة السيارة",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                   
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(
                        value: brand,
                        items: cubit.brandsList.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                        hint: const Text("brand"),
                        isExpanded: true,
                        onChanged: (dynamic item){setState(() {
                          brand = item;
                          cubit.fillModelsList();
                          print("$city $transimition $brand");
                        });}),
                     ),

                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 30),
                        child: const Text("موديل السيارة",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),  

                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(
                        value: model,
                        items: cubit.modelsList.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                        hint: const Text("Model"),
                        isExpanded: true,
                        onChanged: (dynamic item){setState(() {
                          model = item;
                          print("$city $transimition $brand $model");
                        });}),
                    ),   

                 //   UnroundedTextFieldWidget(label: "الموديل", mycontroller: carmodel, myval: myvalEmail, isPassword: false),
                   
                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 30),
                        child: const Text("نظام التعليق",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                    
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(
                        value: transimition,
                        items: ['manual','auto'].map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(),
                        hint: const Text("التعليق"),
                        isExpanded: true,
                        onChanged: (item){setState(() {
                          transimition = item;
                          print("$city $transimition $brand");
                        });}),
                    ),
                        
                    UnroundedTextFieldWidget(label: "kilometers", mycontroller: carKm, myval: myvalEmail, isPassword: false),
                    UnroundedTextFieldWidget(label: "Model Year", mycontroller: carYear, myval: myvalEmail, isPassword: false),
                    UnroundedTextFieldWidget(label: "Color", mycontroller: carColor, myval: myvalEmail, isPassword: false),
                    UnroundedTextFieldWidget(label: "Price", mycontroller: carPrice, myval: myvalEmail, isPassword: false),

                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 10,bottom: 10),
                        child: const Text("الاضافات",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.blue))),


                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 10,bottom: 10),
                        child: const Text("وسائل الراحة",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("المكيف",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.airCondition , onChanged: (value){
                          cubit.addCarAdditions("المكيف,",value, 1);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),
                    
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("فرش جلد",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.leather , onChanged: (value){
                           cubit.addCarAdditions("فرش جلد,",value, 2);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("مرايات كهربا",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.mirrors , onChanged: (value){
                          cubit.addCarAdditions("مرايات كهربا,",value, 3);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("باور",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.power , onChanged: (value){
                          cubit.addCarAdditions("باور,",value, 4);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("ريموت كونترول",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.remoteController , onChanged: (value){
                          cubit.addCarAdditions("ريموت كونترول,",value, 5);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("النظام الزكى لركن السيارة",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.autoPark , onChanged: (value){
                          cubit.addCarAdditions("النظام الزكى لركن السيارة,",value, 6);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 30,bottom: 10),
                        child: const Text("النوافذ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("نوافذ كهربائية امامية",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.frontWindows , onChanged: (value){
                          cubit.addCarAdditions("نوافذ كهربائية امامية,",value, 7);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("نوافذ كهربائية خلفية",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.backWindows , onChanged: (value){
                          cubit.addCarAdditions("نوافذ كهربائية خلفية,",value, 8);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("زجاج فاميه",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.fameGlass , onChanged: (value){
                          cubit.addCarAdditions("زجاج فاميه,",value, 9);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 30,bottom: 10),
                        child: const Text("نظام الصوت",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("بلوتوث",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.blutouth , onChanged: (value){
                          cubit.addCarAdditions("بلوتوث,",value, 10);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("مدخل AUX",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.aux , onChanged: (value){
                          cubit.addCarAdditions("مدخل AUX,",value, 11);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("مدخل USB",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.usb , onChanged: (value){
                          cubit.addCarAdditions("مدخل USB,",value, 12);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Container(
                        margin: const EdgeInsets.only(right: 20,top: 30, bottom: 10),
                        child: const Text("وسائل الامان",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),   

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("حساسات",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.sensors , onChanged: (value){
                          cubit.addCarAdditions("حساسات,",value, 13);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("وسادة هوائية للسائق",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.driverAirbags , onChanged: (value){
                          cubit.addCarAdditions("وسادة هوائية للسائق,",value, 14);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("وسادة هوائية للركاب",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.passangersAirbags , onChanged: (value){
                          cubit.addCarAdditions("وسادة هوائية للركاب,",value, 15);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),


                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("نظام توزيع قوة الفرامل EBD",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.ebd , onChanged: (value){
                          cubit.addCarAdditions("نظام توزيع قوة الفرامل EBD,",value, 16);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),    

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("نظام الفرامل المانع للانغلاق ABS",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.abs , onChanged: (value){
                          cubit.addCarAdditions("نظام الفرامل المانع للانغلاق ABS,",value, 17);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("نظام ايموبليزر ضد السرقة",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.imoblayser , onChanged: (value){
                          cubit.addCarAdditions("نظام ايموبليزر ضد السرقة,",value, 18);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),

                    Container(
                        margin: const EdgeInsets.only(right: 20,top: 30, bottom: 10),
                        child: const Text("اخرى",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ))),

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("مثبت سرعة",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.speedController , onChanged: (value){
                          cubit.addCarAdditions("مثبت سرعة,",value, 19);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),  

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("قفل مركزى للابواب",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.centerLock , onChanged: (value){
                          cubit.addCarAdditions("قفل مركزى للابواب,",value, 20);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),   

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("انذار",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.alarm , onChanged: (value){
                          cubit.addCarAdditions("انذار,",value, 21);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),  

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("كشافات ضباب",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.lights , onChanged: (value){
                          cubit.addCarAdditions("كشافات ضباب,",value, 22);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),  

                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text("كاميرا خلفية",style: TextStyle(fontSize: 18, )),
                        const Spacer(),
                        CupertinoSwitch(value: cubit.backCamera , onChanged: (value){
                          cubit.addCarAdditions("كاميرا خلفية,",value, 23);
                        },),
                        const SizedBox(width: 20,)
                      ],
                    ),                              


                    Container(
                        margin: const EdgeInsets.only(right: 20,top: 30 ,bottom: 10),
                        child: const Text("تفاصيل السيارة",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        maxLines: 7,
                        controller: carInfo,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "وصف السيارة"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 110),
                      child: ElevatedButton(
                        child: const Text(
                          "اضف سيارتى",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 40)
                        ),
                        // color: Colors.blueAccent,
                        onPressed: () {
                         // cubit.splitCarAdditions();
                         cubit.uploadCar(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

 
}

