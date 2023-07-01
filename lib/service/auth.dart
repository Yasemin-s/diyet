import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyet/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import "dart:html";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; //firestore a veri eklemek icin nesne olusturdum

  //giris yap fonksiyonu
  Future<User?> signIn(
      BuildContext context, String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //yonlendirme
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } on FirebaseAuthException catch (e) {
      //hatali oldugunda yonlendirme yapmamasi gerek
      Fluttertoast.showToast(msg: "Email ya da şifre hatalı",);
    }
    //return null;
  }

  //cikis yapma fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayit ol fonksiyonu
  Future<User?> createUser(
      String email, String password, String confirmPassword) async {
    if (password == confirmPassword) {
      //sifrelerin ayni olmasini kontrol ediyor.
      
      //emal kontrolu
      try {
        final UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: "kaydedildi");
          try {
            await _firestore
                .collection("Person")
                .doc(userCredential.user!.uid)
                .set({
              'id' : userCredential.user!.uid,
              'email': email,
              'password': password,
            });

          } catch (e) {
            Fluttertoast.showToast(msg: "belge olusmada hata olustu");
          }
        }
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message!);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Şifreler farklı. kayıt gerceklesmedi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[600],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}
