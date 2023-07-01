//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;
  

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return 
          Padding(
              padding: const EdgeInsets.symmetric(horizontal:0.0),
              child: TextField(
                controller: controller, //bu alana bir seyler yazdigimizda , buna erismek icin controller kullaniriz
                 obscureText: obscureText, //yazarken  karakterleri gizler.
                  decoration: InputDecoration(
                  
                                prefixIcon:this.prefixIcon,
                                hintText: this.hintText,
                                filled: true,
                                fillColor: Color(0xB1FFFFFF),
                                border:const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFFFFFF), width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
              ),
            );
    
         
  }
}
