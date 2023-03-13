import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CapacityStatusScreen extends StatefulWidget {
  const CapacityStatusScreen({Key? key}) : super(key: key);

  @override
  State<CapacityStatusScreen> createState() => _CapacityStatusScreenState();
}
class _CapacityStatusScreenState extends State<CapacityStatusScreen> {
  Color szin=Colors.green;
  Color belsoszin=Colors.green.shade900;
  String edzoterem_neve="FormasFitnes";
  String location="Str.Sportivilor 2A 23.";
  String nyitvatartas="Open beetween 07:00-23:00";
  String szoveg="At the moment,there are\nplenty of free spots in this\nlocation.We are waiting for\nyou at the gym";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Club Acces"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                 for(int i=0;i<5;++i) addGYM()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Padding addGYM(){
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        height: 25.h,
        width: 95.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple),
            color: szin,
            borderRadius:
            BorderRadius.all(Radius.circular(10.sp))),
        child: Row(
          children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
                child: CircleAvatar(
                  backgroundColor: belsoszin,
                  radius: 20.sp,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(edzoterem_neve,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                 Text(location,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                 Text(nyitvatartas,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                 Text(szoveg,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
               ],
              )
          ],
        )
      ),
    );
  }
}