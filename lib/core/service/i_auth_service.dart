// import 'package:denemedeneme/core/model/my_app_user.dart';

// /***** */
// //bu projede su serrvisi kullanana gercek siniflar mutlaka su metotlari kullansin
// //pojede kullanilacak mettotlari gostrecek, yon verecek. iclerini sonra doldurcaz.

// abstract class IAuthService{

//   //kullanici olusturma
//   //olusturdugum kullanicinin uygulama icinde myappuser ile temsil edilmesini istiyorum.bu yuzden geriye myappuser dondu
//   Future<MyAppUser> createUserWithEmailAndPassword(
//     {required String email, required String password});


//   //giris yapma
//   Future<MyAppUser> signInWithEmailAndPassword(
//     {required String email, required String password});


//    //cikis yapma
//    Future<void> signOut();

//   //kullanicinin cikis yapip yapmadigini gosteren fonksiyon . ? ile null olabilir dedik
//   //stream ler, surekli akis saglayan yapialrdir.
//   Stream<MyAppUser?> get onAuthStateChanged;

// }
