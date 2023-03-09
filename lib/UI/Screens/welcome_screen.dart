import 'package:edzoteremappv2/UI/Screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    cim = titles[0];
    szoveg = description[0];
    super.initState();
  }
  final navigatorKey=GlobalKey<NavigatorState>();
  int szamlalo = 0;
  String cim = '';
  String szoveg = '';
  List<String> titles = [
    "Welcome to\nGetYourselfMoving",
    "First of all\nyou need to register",
    "And then\nyou can use our features",
    "Lets\nstart"
  ];
  List<String> description = [
    "GetYourselfMoving will make\nyour GYM experiense so much better\n#GYMlovers",
    "You can make you own account\nwith your e-mail,\nmake sure your password is strong!",
    "Our top features are like,\nbought memebership in the easiest way\nget your own trainer etc.",
    "Lets start our journey,\nwe hope that you will use our app\nwith a good experience!"
  ];
  String next = "NEXT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(40))),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    cim,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    szoveg,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < 4; ++i) buildIndicator(szamlalo == i),
                  Padding(
                    padding: EdgeInsets.only(left:14.w,right: 10.w),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: ElevatedButton(
                            onPressed: () {
                              szamlalo++;
                              if (szamlalo == 4) {
                                Navigator.pop(context);
                                Navigator.of(context).push(_createRoute());
                              }
                              else if(szamlalo==3){
                                setState(() {
                                  cim = titles[szamlalo];
                                  szoveg = description[szamlalo];
                                  next="START";
                                });
                              }
                              else {
                                setState(() {
                                  cim = titles[szamlalo];
                                  szoveg = description[szamlalo];
                                });
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side:
                                        const BorderSide(color: Colors.black)))),
                            child: Text(next)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network(
                  'https://img.freepik.com/premium-photo/dumbbells-white-background_144962-2747.jpg?w=1060',
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(right: 1.w,top: 2.h),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
