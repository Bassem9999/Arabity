import 'package:arabity/components/controllers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrobDownWidget extends StatefulWidget {
String hint;  
String? choice;
List<String?> menu = ['qe','er','tg'];
List<String?> testmenu = ['qe','er','tg'];
String? city;
MyDrobDownWidget({super.key,required this.hint,required this.choice,required this.menu});

  @override
  State<MyDrobDownWidget> createState() => _MyDrobDownWidgetState();
}

class _MyDrobDownWidgetState extends State<MyDrobDownWidget> {

  @override
  Widget build(BuildContext context) {

    return Text(""); 
    // return     Container(
    //                  width: 100,
    //                  margin: EdgeInsets.only(top:10,bottom: 40,left: 57,right: 70),
    //                  child: DropdownButton(
    //                     value: widget.city,
    //                     hint: Text("City"),
    //                     dropdownColor: Colors.grey,
    //                     icon: Icon(Icons.arrow_drop_down),
    //                     style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: Colors.black),
    //                     onChanged: (String? newvalue){
    //                       setState(() {
    //                         widget.city = newvalue ;
    //                          print("$brand $city $transimition");
    //                       });
    //                     },
    //                    items: ['eret','rtrt'].map((valueitem){
    //                     return DropdownMenuItem(
    //                       value: valueitem, 
    //                       child: Text(valueitem),
    //                     );
                       
    //                    }).toList()
                       
    //                    ),
    //                );


//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 24),
//       padding:const EdgeInsets.only(right:10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey)
//       ),
//       child: DropdownButton(
//         borderRadius: BorderRadius.circular(30),
//         isExpanded: true,
//         value: widget.choice,
//         hint: Text(widget.hint),
//         items: widget.menu.map((item) {
//           return DropdownMenuItem(
//               value: item,
//               child: Container(
//                   height: 40,
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   alignment: Alignment.centerLeft,
//                   child: Text(item)));
//           }).toList(),
//           onChanged: (String? item) => setState(() {
//                 widget.choice = item;
//                 print("$brand $city $transimition");
//             }),
//       ),
//     );
   }
}



// class MyAddressDrobDownWidget extends StatefulWidget {
// String hint;  
// String? choice;
// List menu;
// var function;
// MyAddressDrobDownWidget({super.key,required this.hint,required this.choice,required this.menu,required this.function});

//   @override
//   State<MyAddressDrobDownWidget> createState() => _MyAddressDrobDownWidgetState();
// }

// class _MyAddressDrobDownWidgetState extends State<MyAddressDrobDownWidget> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
//       padding:const EdgeInsets.only(right:10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey)
//       ),
//       child: DropdownButton(
//         borderRadius: BorderRadius.circular(30),
//         isExpanded: true,
//         value: widget.choice,
//         hint: Text(widget.hint),
//         items: widget.menu.map((item) {
//           return DropdownMenuItem(
//               value: item,
//               child: Container(
//                   height: 40,
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   alignment: Alignment.centerLeft,
//                   child: Container(alignment: Alignment.centerRight,child: Text(item))));
//           }).toList(),
//           onChanged: (dynamic prov) {
//             setState(() {
//                 widget.choice = prov;
//                 widget.function;
//             });
//         },
//       ),
//     );
//   }
// }

