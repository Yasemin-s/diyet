import 'package:diyet/pages/program.dart';
import 'package:flutter/material.dart';

import '../../components/Colors.dart';




class Energy extends StatefulWidget {
  const Energy({super.key});

  @override
  State<Energy> createState() => _EnergyState();
}

class _EnergyState extends State<Energy> {
  List<String> itemList = ['Yoğun Tempo', 'Orta Tempo', 'Az Tempo', 'Düşük Tempo'];

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
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
  children: <Widget>[
    GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 100,
        
        color: Colors.green[600],
        child: const Center(child: Text('Yoğun Tempo')),
      ),
    ),
    const SizedBox(height: 20,),
    GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 100,
        color: Colors.green[400],
        child: const Center(child: Text('Orta Tempo')),
      ),
    ),
    const SizedBox(height: 20,),
    GestureDetector(
       onTap: () {
        
      },
      child: Container(
        height: 100,
        color: Colors.green[200],
        child: const Center(child: Text('Az Tempo')),
      ),
    ),
    const SizedBox(height: 20,),
     GestureDetector(
       onTap: () {
        
      },
       child: Container(
        height: 100,
        color: Colors.green[100],
        child: const Center(child: Text('Düşük Tempo')),
         ),
     ),
   const  SizedBox(height: 150,),

 SizedBox(
                            height: 50,
                            width: 50,   
                            child: GestureDetector(
                             // onTap: widget.onTap,
                              child: ElevatedButton(
                              onPressed: (){ //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ProgramPage(),),);

                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.greenButtonColor),
                              ),
                              child: const Text('>'),
                            ),
                            ),                  
        
                          ),
                        const  SizedBox(height: 50,),
               const Text(
                  "Gün hareketliliğini Giriniz",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42),
                  textAlign: TextAlign.center,
                )

  ],
          ),
    ),
          ),
        
      
    );
  }
}
