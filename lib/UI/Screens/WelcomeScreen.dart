import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen>{

  @override
  void initState() {
    super.initState();
  }
  int szamlalo=1;

  String cim="Elso kepkocka\ncim";
  String szoveg="Elso kepkocka szoveg";

  String masodik_kepCim="masodik\n kepkocka cim";
  String masodik_kepSzoveg="masodik kepkocka szoveg";

  String harmadik_kepCim="harmadik\n kepkocka cim";
  String harmadik_kepSzoveg="harmadik kepkocka szoveg";

  String negyedik_kepCim="Compare multiple cars at\nonce to find the best one";
  String negyedik_kepSzoveg="negyedik kepkocka szoveg";

  String next="NEXT";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(245, 245, 245, 1),
      body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        cim,
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        szoveg,
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 15,color: Colors.white),
                      ),
                    ),
                  ),
                   SizedBox(
                     height: 140,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       for(var i=1;i<5;++i) buildIndicator(szamlalo==i),
                       Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: Align(
                           alignment: Alignment.bottomRight,
                           child: SizedBox(
                             width: 80,
                             height: 80,
                             child: ElevatedButton(
                              onPressed: () {
                                szamlalo++;
                                if(szamlalo==2){
                                  setState(() {
                                    cim=masodik_kepCim;
                                    szoveg=masodik_kepSzoveg;
                                  });
                                }else if(szamlalo==3){
                                  setState(() {
                                    cim=harmadik_kepCim;
                                    szoveg=harmadik_kepSzoveg;
                                  });
                                }else if(szamlalo==4){
                                  setState(() {
                                    cim=negyedik_kepCim;
                                    szoveg=negyedik_kepSzoveg;
                                    next="START";
                                  });
                                }else if(szamlalo==5){
                                  //bedob a fokeprenyore
                                }
                              },
                                child: Text(next),
                                 style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(Colors.black),
                                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                         RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10),
                                             side: BorderSide(color: Colors.black)
                                         )
                                     )
                                 )
                  ),
                           ),
                         ),
                       ),
                     ],
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Image.network(
                        'https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/homepage/model_choose/2023/aventador_ultimae_m.png',
                      width: double.infinity,
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
  Widget buildIndicator(bool isSelected){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
