import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}
class _AboutScreenState extends State<AboutScreen>{
  final sendEmail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
        color: Colors.white,
    ),
    ),
    body: SingleChildScrollView(
      child: SafeArea(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Expanded(
                  child:Column(
                    children:const <Widget>[
                      Divider(
                          color: Colors.black
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "GYM-5 Version: 1.18.0.1",style:TextStyle(
                    fontSize: 30,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child:Text(
                    "Copyright(c) 2023 GetYourselfMoving5 KFT.",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "All right reserved www.getyourselfmoving.com",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Datapack version: 14.5",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Expanded(
                  child:Column(
                    children:const <Widget>[
                      Divider(
                          color: Colors.black
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Contact:",style:TextStyle(
                    fontSize: 30,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Email: gym5-support@gmail.com",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Telephone: RO: 0724158155/ INT +300751865452",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.h,
                child:const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Location: Romanian Mures Str.Sportivilor 55",style:TextStyle(
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Expanded(
                  child:Column(
                    children:const <Widget>[
                      Divider(
                          color: Colors.black
                      )
                    ],
                  ),
                ),
              ),
          ]
        )
      ),
    ),
    );
  }
}