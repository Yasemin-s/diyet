// //hatalı sayfa
// import 'package:diyet/pages/informations/sigara_alkolkullannimi.dart';
// import 'package:flutter/material.dart';
// import 'package:roundcheckbox/roundcheckbox.dart';

// import '../../components/Colors.dart';

// class MealPlan extends StatefulWidget {
//   const MealPlan({super.key});

//   @override
//   State<MealPlan> createState() => _MealPlan();
// }

// class _MealPlan extends State<MealPlan> {

// bool meal_plan = false;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFafd37c),
//               Color(0xFF1c4c19)
//             ], // Kullanmak istediğiniz renkler
//             begin: Alignment.topLeft, // Gradyanın başlangıç noktası
//             end: Alignment.bottomRight, // Gradyanın bitiş noktası
//           ),
//         ),
//         child: Center(
//           child: ListView(
//             children: [
// //Checkedbox
//               Padding(
//                 padding: EdgeInsets.all(70),
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           RoundCheckBox(
//                             onTap: (selected) {






//                             },
//                             checkedWidget:
//                                 Icon(Icons.mood_bad, color: Colors.white),
//                             uncheckedWidget: Icon(Icons.mood),
//                             animationDuration: Duration(
//                               seconds: 1,
//                             ),
//                           ),
//                           const Text(
//                             '  Sağlıklı Düzenli Beslenirim',
//                             style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           RoundCheckBox(
//                             onTap: (selected) {

   


//                             },
//                             checkedWidget:
//                                 Icon(Icons.mood_bad, color: Colors.white),
//                             uncheckedWidget: Icon(Icons.mood),
//                             animationDuration: Duration(
//                               seconds: 1,
//                             ),
//                           ),
//                           const Text(
//                             '  Sağlıklı Düzensiz Beslenirim',
//                             style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           RoundCheckBox(
//                             onTap: (selected) {


//                             },
//                             checkedWidget:
//                                 Icon(Icons.mood_bad, color: Colors.white),
//                             uncheckedWidget: Icon(Icons.mood),
//                             animationDuration: Duration(
//                               seconds: 1,
//                             ),
//                           ),
//                           const Text(
//                             '  Düzensiz Beslenirim',
//                             style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     RoundCheckBox(
//                       //       onTap: (selected) {
//                       //       },
//                       //       checkedWidget:
//                       //           Icon(Icons.mood_bad, color: Colors.white),
//                       //       uncheckedWidget: Icon(Icons.mood),
//                       //       animationDuration: Duration(
//                       //         seconds: 1,
//                       //       ),
//                       //     ),
//                       //     const Text(
//                       //       '  Düzensiz Beslenirim',
//                       //       style: TextStyle(
//                       //           fontSize: 28,
//                       //           fontWeight: FontWeight.bold,
//                       //           color: Colors.white),
//                       //     ),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(
//                 height: 200,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 50,
//                 child: GestureDetector(
//                   // onTap: widget.onTap,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SigaraAlkolKullanimi(),
//                         ),
//                       );
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           AppColors.greenButtonColor),
//                     ),
//                     child: const Text('>'),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const Text(
//                 "Beslenme Düzeninizi seçiniz",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 42),
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
