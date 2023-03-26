import 'package:edzoteremappv2/Models/user_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActiveMembershipScreen extends StatefulWidget {
  ActiveMembershipScreen({Key? key,required this.userDB}) : super(key: key);

  CustomUser? userDB;
  @override
  State<ActiveMembershipScreen> createState() => _ActiveMembershipScreenState();
}
class _ActiveMembershipScreenState extends State<ActiveMembershipScreen> {
  Color slider_color=Colors.white;
  double days=0;
  double daysRemaining=0;
  @override
  void initState() {
    calcualte_slider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Your membership"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 35.h,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:5.sp,left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${widget.userDB?.name}',style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                          Text('${widget.userDB?.memb_date.toString()}',style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                          Text('${widget.userDB?.membership}',style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                        ]//Column children
                ),
                  ),
                  SizedBox(
                    height: 40.sp
                  ),
                  Slider(
                    activeColor: slider_color,
                    onChanged: (value) => print(value),
                    min: 0,
                    max: days,
                    value: daysRemaining,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:15.sp),
                        child: Text("0",style: TextStyle(fontSize:20.sp),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right:15.sp),
                        child: Text(days.toString(),style: TextStyle(fontSize:20.sp)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void calcualte_slider(){
    if(widget.userDB?.membership=="STANDARD CLUJ"||widget.userDB?.membership=="STANDARD TG MURES"||widget.userDB?.membership=="STANDARD TOPLITA"||widget.userDB?.membership=="NATIONAL"){
      days=30;
      DateTime? now=DateTime.now();
      daysRemaining=days-widget.userDB!.memb_date.difference(DateTime.now()).inDays.toDouble();
      if(daysRemaining>25){
        slider_color=Colors.red;
      }
    }else if(widget.userDB?.membership=="NATIONAL 12 months") {
      days=360;
      DateTime? now=DateTime.now();
      daysRemaining=days+now.difference(widget.userDB!.memb_date).inDays.toDouble();
      if(daysRemaining>355){
        slider_color=Colors.red;
      }
    }else if(widget.userDB?.membership=="NATIONAL 6 months"){
      days=180;
      DateTime? now=DateTime.now();
      daysRemaining=days+now.difference(widget.userDB!.memb_date).inDays.toDouble();
      if(daysRemaining>175){
        slider_color=Colors.red;
      }
    }
  }
}