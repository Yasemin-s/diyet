import 'package:diyet/components/colors.dart';
import 'package:diyet/components/my_textfield.dart';
import 'package:diyet/pages/informations/gender.dart';
import 'package:diyet/pages/sign_in.dart';
import 'package:diyet/service/auth.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
   const SignUp({super.key,});
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
                      color: AppColors.buttonTextColor),
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
                          prefixIcon: const Icon(Icons.supervised_user_circle),
                        ),
                        const SizedBox(height: 20),
                          MyTextField(
                            controller: passwordController,
                            hintText:  'Şifre',
                            obscureText: false,
                            prefixIcon:const Icon(Icons.mail),
                            ),
                        const SizedBox(height: 20),
                         MyTextField(
                            controller: confirmPasswordController,
                            hintText:  'Şifreyi tekrar giriniz',
                            obscureText: true,
                            prefixIcon:const Icon(Icons.key),
                            ),
                        const SizedBox(height: 20),
                       SizedBox(
                            height: 50,
                            width: 370,
                            child: GestureDetector(
                             //  onTap: widget.onTap,
                              child: ElevatedButton(
                              onPressed: () { //gerekli kontrolleri yapman gerek
                                 _authService.createUser(emailController.text, passwordController.text, confirmPasswordController.text)
                                 .then((value){
                                  return Navigator.push(context, MaterialPageRoute(builder: (context) => GenderPage()));
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
                                    builder: (context) => const SignIn(),
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
