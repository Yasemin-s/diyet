//import 'package:cloud_firestore/cloud_firestore.dart';  //kullanicinin verileri ekleme icin kullandigimiz paket
import 'package:denemedeneme/components/colors.dart';
import 'package:denemedeneme/components/my_textfield.dart';
import 'package:denemedeneme/pages/sign_in.dart';
import 'package:denemedeneme/service/auth.dart';
import 'package:flutter/material.dart';

//kayit silme eklenebilir.
//kayit ol vs gibi islemleri tek sayfada fonksiyon olrak yapmayi dene.

class SignUp extends StatefulWidget {
  SignUp({super.key,});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

//kayitolma bilgileri

final emailController = TextEditingController();
final  passwordController= TextEditingController();
final confirmPasswordController = TextEditingController();


//authservice i kullanmak icin nesne olusturdum
AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                 Text(
                  "Kayıt ol",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: AppColors.headerColor),
                ),

                const SizedBox(height: 20),

                Card(
                  shape: RoundedRectangleBorder(
                    side:  BorderSide(
                      color: AppColors.buttonTextColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  elevation: 8,
                  color: AppColors.sign_inContainerColor,// burada arka plan rengi belirlenir
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [


                         MyTextField(
                          controller: emailController,
                          hintText: 'E-mail',
                          obscureText: false,
                          prefixIcon: Icon(Icons.mail),
                        
                        ),

                        const SizedBox(height: 20),

                          MyTextField(
                            controller: passwordController,
                            hintText:  'Şifre',
                            obscureText: true,
                            //prefixIcon: Icon(Icons.key),
                            prefixIcon: Icon(Icons.key),
                            ),
                  


                        const SizedBox(height: 20),

                         MyTextField(
                            controller: confirmPasswordController,
                            hintText:  'Şifreyi tekrar giriniz',
                            obscureText: true,
                            prefixIcon:Icon(Icons.key),
                            ),
                  
                       
                        const SizedBox(height: 20),

                       SizedBox(
                            height: 50,
                            width: 370,
                            child: GestureDetector(
                              child: ElevatedButton(
                                onPressed: () { //gerekli kontrolleri yapman gerek
                                 _authService.createUser(emailController.text, passwordController.text, confirmPasswordController.text)
                                 .then((value){
                                  return Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                 });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.greenButtonColor),
                                ),
                                child: const Text('Kayıt Ol'),  //kayit oldan sonra giris ekranina atacak
                              ),
                            ),
                           
                          ),

                          const SizedBox(height: 20),

                             Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hesabınız var mı?",
                            style: TextStyle(
                              color: AppColors.buttonTextColor,
                            ),),
                            const SizedBox(width: 4,),
                            GestureDetector(  
                              onTap: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                    ),);
                              },
                              child:  Text("Oturum aç",
                                style: TextStyle(
                                  color: AppColors.oriantationTextButton,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          ),

    ));
  }
}


//diger girisleri ayri sayfada da yapabilirsin
/*
cloud firestore baslatirken  in production mod da cikan kod
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
*/