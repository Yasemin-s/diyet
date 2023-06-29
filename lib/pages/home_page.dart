import 'package:denemedeneme/pages/sign_in.dart';
import 'package:flutter/material.dart';
class HomePage
 extends StatelessWidget {
  const HomePage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("home page"),
            SizedBox(
                          height: 50,
                          width: 370,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  SignIn(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(197, 199, 82, 1)),
                            ),
                            child: const Text('Geri Dön'),
                          ),
                        ),
        ],
      ),
    ),);
  }
}