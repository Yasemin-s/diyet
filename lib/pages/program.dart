//program gosterme sayfasi
//kalori sayfasi


import 'package:diyet/api/my_home_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

// ignore: camel_case_types
class _ProgramPageState extends State<ProgramPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFafd37c),
              Color(0xFF1c4c19)
            ], // Kullanmak istediğiniz renkler
            begin: Alignment.topLeft, // Gradyanın başlangıç noktası
            end: Alignment.bottomRight, // Gradyanın bitiş noktası
          ),
        ),
        //veritabanından alip aticak

        child: MyHomePage(title: 'Haftalık Diyet Programı',),
      ),
    );
  }
}
