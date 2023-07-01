import 'dart:convert';

import 'package:diyet/api/loadData.dart';
import "package:diyet/firebase_options.dart";
import 'package:diyet/pages/program.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


Future<LoadData> apiCall() async {
  String urlString = "http://localhost:3000/db";
  Uri uri = Uri.parse(urlString);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    print('Hata Kodu: ${response.statusCode}');
    throw Exception("Bir hata oluştu");
  }
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
    
    home:Scaffold(
     body: ProgramPage(),  //ProgramPage up
    )
    );
    
  }
}