import 'package:diyet/pages/informations/energy.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../components/Colors.dart';


class Sport extends StatefulWidget {
  const Sport({super.key});

  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {
  
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
            children: [
//Checkedbox
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    
            Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  checkedWidget: Icon(Icons.mood_bad, color: Colors.white),
                  uncheckedWidget: Icon(Icons.mood),
                  animationDuration: Duration(
                    seconds: 1,
                  ),
                  
                ),

                const Text(
                            '  Haftada 2 kez spor yapıyorum.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
              ],
            ),
            SizedBox(height: 20,),
Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  checkedWidget: Icon(Icons.mood_bad, color: Colors.white),
                  uncheckedWidget: Icon(Icons.mood),
                  animationDuration: Duration(
                    seconds: 1,
                  ),
                  
                ),
                const Text(
                            '  Haftada 3 kez spor yapıyorum.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  checkedWidget: Icon(Icons.mood_bad, color: Colors.white),
                  uncheckedWidget: Icon(Icons.mood),
                  animationDuration: Duration(
                    seconds: 1,
                  ),
                  
                ),
                const Text(
                            '  Haftada 4 kez spor yapıyorum.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  checkedWidget: Icon(Icons.mood_bad, color: Colors.white),
                  uncheckedWidget: Icon(Icons.mood),
                  animationDuration: Duration(
                    seconds: 1,
                  ),
                  
                ),
                
                const Text(
                            '  Spor Yapmıyorum.',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
              ],
            ),

                    ],
                  ),
                ),
              ),

             const SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: GestureDetector(
                  // onTap: widget.onTap,
                  child: ElevatedButton(
                    onPressed: () {
                      //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Energy(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.greenButtonColor),
                    ),
                    child: const Text('>'),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Spor Yapıyor Musunuz?",
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
