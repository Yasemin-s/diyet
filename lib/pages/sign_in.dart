import 'package:denemedeneme/components/colors.dart';
import 'package:denemedeneme/components/my_textfield.dart';
import 'package:denemedeneme/pages/sign_up.dart';
import 'package:denemedeneme/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

 const SignIn({super.key,});  

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 //metin almak icin
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final _textEditingController = TextEditingController();
 
  //autservice sinifini kullanmam icin o siniftan nesne tanimlamam gerek.
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView( //tasma sorunu icin

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
                  "Merhaba",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: AppColors.headerColor),
                ),


                const SizedBox(height: 20),


                Card(
                  shape: RoundedRectangleBorder(
                    side:  BorderSide(
                      color:AppColors.generalTextColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  elevation: 8,
                  color: AppColors.sign_inContainerColor, // burada arka plan rengi belirlenir


                  child: Padding(
                    padding: const EdgeInsets.all(16.0),


                    child: Column(


                      children: [


                            MyTextField(
                            controller: emailController,
                            hintText:  'E-mail',
                            obscureText: false,
                            prefixIcon:Icon(Icons.mail),
                            ),
                  
                        const SizedBox(height: 20),

                        
                          MyTextField(
                            controller: passwordController,
                            hintText:  'Şifre',
                            obscureText: true,
                            prefixIcon:Icon(Icons.key),
                            ),
                  
                        GestureDetector(
                          child: Text("Şifreni mi unuttun?"),
                          onTap: (){
                             //Fluttertoast.showToast(msg: "tiklandiii");
                            // acılır pencerede email al
                            
                             // _authService.sendPasswordResetEmail(emailController.text);
                          }
                          ),

                        const SizedBox(height: 20),
                        
                        SizedBox(
                            height: 50,
                            width: 370,
                            child: GestureDetector(
                              child: ElevatedButton(  //gerekli kontrolleri yapman gerek
                              onPressed: (){ //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek
                                _authService.signIn(context, emailController.text, passwordController.text);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.greenButtonColor),
                              ),
                              child: const Text('Giriş Yap'),
                            ),
                            ),
        
                          ),



                        const SizedBox(height: 20),


                         Text(
                          "ya da",
                          style: TextStyle(
                              color: AppColors.headerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),


                        const SizedBox(height: 20),


                        SizedBox(
                          height: 50,
                          width: 370,
                          child: ElevatedButton(
                            onPressed: () {
                              // Butona basıldığında yapılacak işlemler burada yer alır.
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.TextfieldColor),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/facebook.png',
                                  width: 30,
                                ),
                                 Text(
                                  '   Facebook ile giriş yap',
                                  style: TextStyle(color: AppColors.generalTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),



                        const SizedBox(height: 20),


                        SizedBox(
                          height: 50,
                          width: 370,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Butona basıldığında yapılacak işlemler burada yer alır.
                              //_authService.signInWithGoogle(context);
                              //_authService.signInWithGoogle(context);
                              //.then kullanımı , gelen değer ile sayfa geçişi yap diyoruz aslinda
                              },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(255, 255, 255, 0.7)),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 30,
                                ),
                                 Text('   Google ile giriş yap',
                                    style: TextStyle(color: AppColors.generalTextColor)),
                              ],
                            ),
                          ),
                        ),


                        const SizedBox(height: 20),


                        SizedBox(
                          height: 50,
                          width: 370,
                          child: ElevatedButton(
                            onPressed: () {
                              // Butona basıldığında yapılacak işlemler burada yer alır.
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                 AppColors.TextfieldColor),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/apple.png',
                                  width: 30,
                                ),
                                 Text('   Apple ile giriş yap',
                                    style: TextStyle(color: AppColors.generalTextColor)),
                              ],
                            ),
                          ),
                        ),


                           const SizedBox(height: 20,),

                          //uye ol kismi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Üye değil misiniz?",
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),),
                            const SizedBox(width: 4,),
                            GestureDetector(  //hareketlendirmek icin, tiklama ozelligi iciin
                              onTap: () {
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                    ),);
                              },
                              child: const Text("Üye ol",
                                style: TextStyle(
                                  color: Colors.blue,
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
          ),
        );

  }
}
