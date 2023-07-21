import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyet/pages/informations/sport.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//okey
import '../components/Colors.dart';

// ignore: camel_case_types
class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

// ignore: camel_case_types
class _categoriesState extends State<categories> {

  String category = "";


  int selectedTileIndex = -1;
  List<String> itemTexts = [
    'KiloVerme',
    'KiloAlma',
    'KiloKoruma',
    'SaglikliBeslenme',
    'UzunYasam',
    'FazlaEnerji',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFafd37c),
              Color(0xFF1c4c19)
            ], // Kullanmak istediğiniz renkler
            begin: Alignment.topLeft, // Gradyanın başlangıç noktası
            end: Alignment.bottomRight, // Gradyanın bitiş noktası
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTileIndex = index;
                      });
                    },
                    child: Container(
                      height: index == selectedTileIndex ? 150.0 : 100.0,
                      decoration: BoxDecoration(
                        color: index == selectedTileIndex
                            ? AppColors.greenButtonColor.withOpacity(0.5)
                            : AppColors.containerColor1,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          itemTexts[index],
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: itemTexts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: GestureDetector(
                  // onTap: widget.onTap,
                  child: ElevatedButton(
                    onPressed: () {
                      //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek


                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final myUid = user?.uid;
                                Fluttertoast.showToast(msg: "id si : $myUid",);

                                //seçimi firebase e ekleme
                                final FirebaseFirestore firestore = FirebaseFirestore.instance;
                                final String category= itemTexts[selectedTileIndex];
                                final String uid = "$myUid";
                                firestore.collection('Person')
                                .doc(uid)
                                .update({'category': category, });


       




                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sport(), //mealplan
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.greenButtonColor),
                    ),
                    child: const Text('>'),
                  ),
                ),
              ),
             const SizedBox(
                height: 50,
              ),
              const Text(
                "Kategori Seçiniz",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
