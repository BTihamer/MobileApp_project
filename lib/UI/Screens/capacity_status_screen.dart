import 'package:edzoteremappv2/UI/Services/gym_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/gym_class.dart';

class CapacityStatusScreen extends StatefulWidget {
  const CapacityStatusScreen({Key? key}) : super(key: key);

  @override
  State<CapacityStatusScreen> createState() => _CapacityStatusScreenState();
}
class _CapacityStatusScreenState extends State<CapacityStatusScreen> {
  Color bgColor=Colors.green;
  Color circleColor=Colors.green.shade900;
  GymProvider gymProv=new GymProvider();
  String text="";
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
                 for(int i=0;i<5;++i) addGYM(i)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Padding addGYM(int index){
    Gym edzoterem=gymProv.getGymbyindex(index);
    if(edzoterem.realtimeUsers<25){
      circleColor=Colors.green.shade900;
      bgColor=Colors.green;
      text="At this moment,there are\nplenty of free spots in this\n location.We are waiting for\nfor you in the gym";
    }else if(edzoterem.realtimeUsers<50&&edzoterem.realtimeUsers>25){
      circleColor=Colors.orange.shade900;
      bgColor=Colors.orange;
      text="At the moment,there are still\nfree spots in this location.Be\nadvised,there might not be\nany available spots very soon";
    }else if(edzoterem.realtimeUsers>50){
      circleColor=Colors.red.shade900;
      bgColor=Colors.red;
      text="At the moment,...";
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
        height: 25.h,
        width: 95.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple),
            color: bgColor,
            borderRadius:
            BorderRadius.all(Radius.circular(10.sp))),
        child: Row(
          children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
                child: CircleAvatar(
                  backgroundColor: circleColor,
                  radius: 20.sp,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(edzoterem.gymName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                 Text(edzoterem.location,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                 Text(edzoterem.openBeetwin,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                 Text(text,textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
               ],
              )
          ],
        )
      ),
    );
  }
}