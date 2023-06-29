// //auth kisimlarini yoneten widget

// //firebase den gelen kullaniciyi dinleyecek metot. yazdigigmiz stream metotu sayesinde yapicak
// //ve online offline olma durumuna gore giris yap sayfasina yonlendirme yapack.
// import 'package:denemedeneme/core/model/my_app_user.dart';
// import 'package:flutter/material.dart';

// class AuthWidgetBuilder extends StatelessWidget {
//   const AuthWidgetBuilder({super.key, required this.onPageBuilder});

//   //sayfaya yonlendirme islemi yapacagi icin context kullandik.
//   final Widget Function(BuildContext context,AsyncSnapshot<MyAppUser?> snapshot) onPageBuilder;
// //34dk
//   @override
//   Widget build(BuildContext context) {
//     //uygulamada tum sayfalarda ihhtiyacim olacak 1 instance lazim. farkli sayfalarda baska sayfada olan bir dataya ihtiyac olabilir. bunun icin provider paketini kullanicaz ve main dosyasindaki materiallapp i 1 widget ile(multiprovider) saricaz.
//     return Container();
//     // return StreamBuilder<MyAppUser>(
      

//     // );
//   }
// }