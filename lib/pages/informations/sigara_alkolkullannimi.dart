// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:diyet/pages/informations/sport.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../../components/Colors.dart';

// enum Selection { sigaraAlkol, sigara, alkol, none }

// class SigaraAlkolKullanimi extends StatefulWidget {
//   const SigaraAlkolKullanimi({super.key});

//   @override
//   State<SigaraAlkolKullanimi> createState() => _SigaraAlkolKullanimiState();
// }

// class _SigaraAlkolKullanimiState extends State<SigaraAlkolKullanimi> {

// Selection _selection = Selection.none;
 
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
//                 padding: EdgeInsets.all(20),
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
                    
//             Row(
//               children: [

//                 Flexible(
//                   child:  ListTile(
//                   title: const Text('Sigara ve alkol kullanmıyorum'),
//                   leading: SizedBox(
//                     width: 50,
//                     child: Radio(
//                     value: Selection.none,
//                     groupValue: _selection,
//                     onChanged: (Selection? value) {
//                       setState(() {
//                         _selection = value!;
//               });


//                                 final FirebaseAuth auth = FirebaseAuth.instance;
//                                 final User? user = auth.currentUser;
//                                 final myUid = user?.uid;
//                                 Fluttertoast.showToast(msg: "id si : ${myUid}",);

//                                 //seçimi firebase e ekleme
//                                 final FirebaseFirestore firestore = FirebaseFirestore.instance;
//                                 final String sigara_alkol_kullanimi = _selection as String;
//                                 final String uid = "${myUid}";
//                                 firestore.collection('Person')
//                                 .doc(uid)
//                                 .update({'age': sigara_alkol_kullanimi, });


//             },
//           ),
//                   )
//         ),
//                 ),

//                 const Text(
//                             '  Sigara ve alkol kullanıyorum.',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//               ],
//             ),
//            const SizedBox(height: 20,),
// Row(
//               children: [
//                 Flexible(
//                   child:  ListTile(
//                   title: const Text('Sigara ve alkol kullanmıyorum'),
//                   leading: SizedBox(
//                     width: 50,
//                     child: Radio(
//                     value: Selection.none,
//                     groupValue: _selection,
//                     onChanged: (Selection? value) {
//                       setState(() {
//                         _selection = value!;
//               });


//                                 final FirebaseAuth auth = FirebaseAuth.instance;
//                                 final User? user = auth.currentUser;
//                                 final myUid = user?.uid;
//                                 Fluttertoast.showToast(msg: "id si : ${myUid}",);

//                                 //seçimi firebase e ekleme
//                                 final FirebaseFirestore firestore = FirebaseFirestore.instance;
//                                 final String sigara_alkol_kullanimi = _selection as String;
//                                 final String uid = "${myUid}";
//                                 firestore.collection('Person')
//                                 .doc(uid)
//                                 .update({'age': sigara_alkol_kullanimi, });


//             },
//           ),
//                   )
//         ),
//                 ),



//                 const Text(
//                             '  Sigara kullanıyorum.',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//               ],
//             ),
//             SizedBox(height: 20,),
//             Row(
//               children: [

//                 Flexible(
//                   child:  ListTile(
//                   title: const Text('Sigara ve alkol kullanmıyorum'),
//                   leading: SizedBox(
//                     width: 50,
//                     child: Radio(
//                     value: Selection.none,
//                     groupValue: _selection,
//                     onChanged: (Selection? value) {
//                       setState(() {
//                         _selection = value!;
//               });


//                                 final FirebaseAuth auth = FirebaseAuth.instance;
//                                 final User? user = auth.currentUser;
//                                 final myUid = user?.uid;
//                                 Fluttertoast.showToast(msg: "id si : ${myUid}",);

//                                 //seçimi firebase e ekleme
//                                 final FirebaseFirestore firestore = FirebaseFirestore.instance;
//                                 final String sigara_alkol_kullanimi = _selection as String;
//                                 final String uid = "${myUid}";
//                                 firestore.collection('Person')
//                                 .doc(uid)
//                                 .update({'age': sigara_alkol_kullanimi, });


//             },
//           ),
//                   )
//         ),
//                 ),

//                 const Text(
//                             '  Alkol kullanıyorum.',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//               ],
//             ),
//             SizedBox(height: 20,),
//             Row(
//               children: [

//                 Flexible(
//                   child:  ListTile(
//                   title: const Text('Sigara ve alkol kullanmıyorum'),
//                   leading: SizedBox(
//                     width: 50,
//                     child: Radio(
//                     value: Selection.none,
//                     groupValue: _selection,
//                     onChanged: (Selection? value) {
//                       setState(() {
//                         _selection = value!;
//               });


//                                 final FirebaseAuth auth = FirebaseAuth.instance;
//                                 final User? user = auth.currentUser;
//                                 final myUid = user?.uid;
//                                 Fluttertoast.showToast(msg: "id si : ${myUid}",);

//                                 //seçimi firebase e ekleme
//                                 final FirebaseFirestore firestore = FirebaseFirestore.instance;
//                                 final String sigara_alkol_kullanimi = _selection as String;
//                                 final String uid = "${myUid}";
//                                 firestore.collection('Person')
//                                 .doc(uid)
//                                 .update({'age': sigara_alkol_kullanimi, });


//             },
//           ),
//                   )
//         ),
//                 ),
//                 const Text(
//                             '  Sigara ve alkol kullanmıyorum.',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//               ],
//             ),

//                     ],
//                   ),
//                 ),
//               ),

//              const SizedBox(
//                 height: 300,
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
//                           builder: (context) => const Sport(),
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
//              const SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 "Sigara veya Alkol Kullanıyor Musunuz?",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40),
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
