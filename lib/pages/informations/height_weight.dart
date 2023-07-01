import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyet/components/colors.dart';
import 'package:diyet/pages/animation_background.dart';
import 'package:diyet/pages/informations/age.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
//okey


class HeightWeight extends StatefulWidget {
  const HeightWeight({Key? key}) : super(key: key);

  @override
  State<HeightWeight> createState() => _HeightWeightState();
}

class _HeightWeightState extends State<HeightWeight> {
  late WeightSliderController _controller;
  double _weight = 170.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _heightvalue = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const AnimationBackgroundPage(), // arkaplan
       
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BOY
                SizedBox(height: 50,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50.0,
                        alignment: Alignment.center,
                        child: Text(
                          "${_weight.toStringAsFixed(1)} cm",
                        
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.containerColor1),
                        ),
                      ),
                      VerticalWeightSlider(
                        controller: _controller,
                        decoration: const PointerDecoration(
                          width: 130.0,
                          height: 3.0,
                          largeColor: Color(0xFF898989),
                          mediumColor: Color(0xFFC5C5C5),
                          smallColor: Color(0xFFF0F0F0),
                          gap: 30.0,
                        ),
                        onChanged: (double value) {
                          setState(() {
                            _weight = value;
                          });
                        },
                        indicator: Container(
                          height: 3.0,
                          width: 200.0,
                          alignment: Alignment.centerLeft,
                          color: AppColors.containerColor1,
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding:  EdgeInsets.only(left: 35, right: 35),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
               const SizedBox(
                  height: 50,
                ),
//KİLO
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${_heightvalue.toStringAsFixed(1)} kg",style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.containerColor1)),
                         
                    SliderTheme(
                      data: SliderThemeData(
    activeTrackColor: AppColors.containerColor1,
    inactiveTrackColor: Colors.green.shade50.withOpacity(0.5),
  
  thumbColor: Colors.green.shade100, ),
                      child: Slider(
                          value: _heightvalue,
                          min:10 ,
                          max: 300,
                          
                          onChanged: (value) {
                            setState(() {
                              _heightvalue=value;
                            });
                          }),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 100,
                ),
                 SizedBox(
                            height: 50,
                            width: 50,   
                            child: GestureDetector( //kilo
                              child: ElevatedButton(
                              onPressed: (){ //gerekli controller yapilmissa bilgi alma sayfasina yonlendirilecek
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final myUid = user?.uid;
                                Fluttertoast.showToast(msg: "id si : ${myUid}",);

                                //seçimi firebase e ekleme
                                final FirebaseFirestore firestore = FirebaseFirestore.instance;
                                final String weight = '${_weight}'; // or 'female'
                                final String height = "${_heightvalue}";
                                final String uid = "${myUid}";
                                firestore.collection('Person')
                                .doc(uid)
                                .update({'weigt': _weight,
                                "height" : _heightvalue });

                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const age(),),);

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
               const Text(
                  "Boy ve Kilonuzu Giriniz",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
