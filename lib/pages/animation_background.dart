import 'package:flutter/material.dart';
import 'package:rive/rive.dart';  //arkapplan icin

class AnimationBackgroundPage extends StatefulWidget {
  const AnimationBackgroundPage({super.key});

  @override
  State<AnimationBackgroundPage> createState() => _AnimationBackgroundPageState();
}

class _AnimationBackgroundPageState extends State<AnimationBackgroundPage> {
int age = 18;

  void incrementAge() {
    setState(() {
      age++;
    });
  }

  void decrementAge() {
    setState(() {
      if (age > 1) {
        age--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RiveAnimation.asset(
              'assets/animations/background_animation1.riv',
              fit: BoxFit.cover),
        
      ),
    );

   }
}
