
// import 'package:denemedeneme/core/model/my_app_user.dart';
// import 'package:denemedeneme/core/service/i_auth_service.dart';
// import 'package:denemedeneme/core/service/mixin_user.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService with ConvertUser implements IAuthService{ //mixin oldugu icin with keywordu ile kullandik.

//   //firebase tarafinda yeni kullanici olusturmak istiyorsan , firebase backendine baglanmami saglayacak firebase nesnesine ihtiyacim var.
//   final FirebaseAuth _authInstance = FirebaseAuth.instance; //bu instance uzerinden firebase e baglanacaz.

//   //myappuser geriye donen metot.
//   MyAppUser _getUser(User? user){
//     return MyAppUser(userId: user!.uid, userMail: user.email!);
//   }


//   @override
//   Future<MyAppUser> createUserWithEmailAndPassword( //bu metodda, bize myappuser nesne dolndur dedik ama icerdeki fonksiyonda UserCredential donuyor. bunu donusturmemiz gerekir ve metod tanimlayarak yapicaz.
//     {required String email, required String password}) async {
//      var _tempUser = await _authInstance.createUserWithEmailAndPassword(
//      email: email, password: password);  //metod. createuser... uzerine gelirsek futuredir. bu yuzdden await isaetledik. await olursa da async olur. ayni sekilde bakarsak geriye usercredantanel tipinde dondugunu goruruz.
//       return convertUser(_tempUser);
//      //throw UnimplementedError();
//   }

//   @override
//   //online kullanici varsa bunun surekli bilgisini vereck 1 metottur.
//   Stream<MyAppUser?> get onAuthStateChanged => _authInstance.authStateChanges().map((_getUser));

//   @override
//   Future<MyAppUser> signInWithEmailAndPassword(
//     {required String email, required String password}) async {
//     var _tempUser = await _authInstance.signInWithEmailAndPassword(
//     email: email, password: password);  //metod. createuser... uzerine gelirsek futuredir. bu yuzdden await isaetledik. await olursa da async olur. ayni sekilde bakarsak geriye usercredantanel tipinde dondugunu goruruz.
//       return convertUser(_tempUser);
//   }

//   @override
//   Future<void> signOut() async {
//     await _authInstance.signOut();
//   }

// }