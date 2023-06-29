import 'package:denemedeneme/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme"),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut().then((value){ //giristen cikis yapma ve onceki sayfalari kapatarak yapar bunu. performans olarak iyidir.
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (_)=> SignIn()), //cikis yapip yendien giris sayfasina yonlendirdik.
                  (Route<dynamic> route) => false);
              });
          }, 
          icon: Icon(Icons.exit_to_app),)
        ],
      ),
      body: Container(child: Text("Profile sayfasi")),
    );
  }
}