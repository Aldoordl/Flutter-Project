// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/widgets/drop_down.dart';

// class DewaTermo extends StatefulWidget {
//   const DewaTermo({super.key});

//   @override
//   State<DewaTermo> createState() => _DewaTermo();
// }

// class _DewaTermo extends State<DewaTermo> {
  

//   Color mainColor = Color.fromARGB(255, 19, 19, 47);
//   Color secondColor = Color(0xFF2849E6);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainColor,
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus(); // Untuk menutup keyboard
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 25.0),
//                 width: 250.0,
//                 child: Text(
//                   "Temperature Converter",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 36,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   labelText: "Input value to convert (°)",
//                   labelStyle: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 18.0,
//                     color: secondColor,
//                   ),
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
//                 onChanged: (value) {
//                   if (value.isNotEmpty) {
                    
//                   } else {
                    
//                   }
//                 },
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   customDropDown( {

//                   }),
//                   Material(
//                     shape: CircleBorder(),
//                     color: secondColor,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(30),
//                       onTap: ,
//                       child: Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: Icon(
//                           Icons.compare_arrows,
//                           color: Colors.white,
//                           size: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                   customDropDown( {
                    
//                   }),
//                 ],
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
