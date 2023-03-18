import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActiveMembershipScreen extends StatefulWidget {
  const ActiveMembershipScreen({Key? key}) : super(key: key);

  @override
  State<ActiveMembershipScreen> createState() => _ActiveMembershipScreenState();
}
class _ActiveMembershipScreenState extends State<ActiveMembershipScreen> {
  double daysleft=10;
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
                          Text("IDE JON A USER NEVE",style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                          Text("LEJARATI DATUM",style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                          Text("TIPUS",style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                          Text("MEG VALAMI KELL CSAK NEM JUT AZ ESZEMBE",style: TextStyle(fontSize: 15.sp),overflow: TextOverflow.ellipsis),
                        ]//Column children
                ),
                  ),
                  SizedBox(
                    height: 40.sp
                  ),
                  Slider(
                    activeColor: Colors.white,
                    onChanged: (value) => print(value),
                    min: 0,
                    max: 30,
                    value: daysleft,
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
                        child: Text("30",style: TextStyle(fontSize:20.sp)),
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
}