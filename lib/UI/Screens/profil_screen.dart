import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}
class _ProfilScreenState extends State<ProfilScreen>{
  List<String> images=["https://toppng.com/uploads/preview/file-save-money-icon-115630905330r1k6kmskb.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:8.sp,bottom: 16.sp),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40.sp,
                    ),
                  ),
                ),
                Center(
                  child: Text(FirebaseAuth.instance.currentUser!.uid.toString(),textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,)),
                ),
                Container(
                  width: 95.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp,top: 20.sp),
                        child:const Align(
                          alignment: Alignment.topLeft,
                            child: Icon(Icons.account_balance_wallet
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:20.sp,top:20.sp),
                        child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Monthly Membership",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:20.sp,top:10.sp),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Until April 2023",style: TextStyle(fontSize: 15))),
                      ),
                    ],
                  ),
                ),
            Padding(
              padding: EdgeInsets.only(top: 10.sp,),
              child: Container(
              width: 95.w,
              height: 10.h,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
                child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.sp),
                        child: SizedBox(
                          height: 38.sp,
                          width: 38.sp,
                          child: Image.network(
                            images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: const Text("Credits",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 140.sp),
                        child: const Text("XY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                    ]
                )
              ),
            ),
                Padding(
                  padding: EdgeInsets.only(top: 10.sp,),
                  child: Container(
                      width: 95.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.sp),
                              child: SizedBox(
                                height: 38.sp,
                                width: 38.sp,
                                child: const Icon(Icons.people),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.sp),
                              child: const Text("Linked Accounts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 78.sp),
                              child: const Text("XY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            ),
                          ]
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.sp,),
                  child: Container(
                      width: 95.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                          color: Colors.white70,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.sp),
                              child: SizedBox(
                                height: 38.sp,
                                width: 38.sp,
                                child: const Icon(Icons.circle_notifications_rounded),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.sp),
                              child: const Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            ),
                      Padding(
                        padding: EdgeInsets.only(left: 60.sp),
                        child: Container(
                          width: 12.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                              BorderRadius.circular(100),
                        ),
                          child:
                          Center(child: Text("XY")),
                        ),
                      ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right))
                          ]
                      )
                  ),
                )
            ]
          )

      ),
    );
  }
}