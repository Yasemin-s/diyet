//firebase islemlerinin tek 1 class da yonetme

//sifremi unuttum kisminda numaraya tek seferlik kod gelebilir.
//kayit ol kisminda sifre belirleme , buyuk kucuk arf noktalam isaret kullanmak zorunlu ve en az 6 karakterli olmmali
//kayitli mail varsa , mailiniz zaten kayitli uyarisi versin  +
//kayit ol kisminda sifrelerin de ayni olmasi gerek. belki gorunur sifre ozelligi eklenebilr. +
//giris yap kisminda
//google ile facebook ve apple ile giris yap kisimlarina bakman gerek
//e posta kayitli mi kontrolu , kayit ol kisminda +

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denemedeneme/pages/home_page.dart';
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
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      //hatali oldugunda yonlendirme yapmamasi gerek
      Fluttertoast.showToast(
        msg: "Email ya da şifre hatalı",
      );
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
              'email': email,
              'password': password,
            });
          } catch (e) {
            Fluttertoast.showToast(msg: "belge olusmada ata olustu");
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

  //Şifre sıfırlama e-postası gönderme
  // Future<void> sendPasswordResetEmail(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //     Fluttertoast.showToast(
  //         msg: "Şifre sıfırlama epostası gönderildi: ${email}");
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "eposta gondermede hata olustu");
  //   }
  // }

  //google girisi

  // Future<void> signInWithGoogle(BuildContext context) async {
  //   //void i user? yaptim.
  //   final GoogleSignInAccount? gUser = await GoogleSignIn()
  //       .signIn(); //oturum acma surecini 1 nesne olusturarak baslattik
  //   final GoogleSignInAuthentication gAuth = await gUser!
  //       .authentication; //olusturdugumuz nesne uzerinden auth islemi icin gereken nesneyi gautha kaydettik. gauth ile giris isleminde gerekli olan bilgileri kullanabilirim.
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: gAuth.accessToken,
  //       idToken: gAuth.idToken); //kullanici olusturma
  //   final UserCredential userCredential =
  //       await _auth.signInWithCredential(credential); //kullanici girisi saglama

  //   //yonlendirme
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => HomePage()));

  //   //return userCredential?.user;  //kullanicinin  istedigin bilgisini dondurursun
  // }
  
}
