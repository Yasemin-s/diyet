import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyet/components/my_textfield.dart';
import 'package:diyet/pages/animation_background.dart';
import 'package:diyet/pages/categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/Colors.dart';
//okey



class age extends StatefulWidget {
  const age({Key? key}) : super(key: key);

  @override
  State<age> createState() => _ageState();
}

class _ageState extends State<age> {
final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const AnimationBackgroundPage(), // arkaplan
          // geri butonu
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Text("Yaşınızı Giriniz:" ,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
               const SizedBox(height: 20,),
                MyTextField(
                controller: ageController,
                 hintText: "age",
                 obscureText: false,
                 prefixIcon: const Icon(Icons.numbers_outlined)),

                const SizedBox(height: 50,),
                
                 SizedBox(
                            height: 50,
                            width: 50,
                            child: GestureDetector(
                              child: ElevatedButton(
                              onPressed: (){ //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek

                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final myUid = user?.uid;
                                Fluttertoast.showToast(msg: "id si : ${myUid}",);

                                //seçimi firebase e ekleme
                                final FirebaseFirestore firestore = FirebaseFirestore.instance;
                                final String age = ageController.text;
                                final String uid = "${myUid}";
                                firestore.collection('Person')
                                .doc(uid)
                                .update({'age': age, });














                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const categories(),),);

                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.greenButtonColor),
                              ),
                              child: const Text('>'),
                            ),
                            ),                  
        
                          ),
                const SizedBox(height: 200,),
                const Text("Yaşınızı ve Avatarınızı Seçiniz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize:38),textAlign:TextAlign.center,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
