import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClubInfoScreen extends StatelessWidget {
  const ClubInfoScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CLUB INFO"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                  children: [
                      SizedBox(
                        height: 35.h,
                        width: double.infinity,
                        child: Image.network("https://i2-prod.gloucestershirelive.co.uk/whats-on/article886481.ece/ALTERNATES/s1227b/gym2PNG.png"),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 8.h,
                        width: 90.w,
                        child: ElevatedButton(onPressed:(){},
                            child: const Text("BUY MEMBERSHIP")),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                          child: Text("SHEDULE",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Monday-Friday",style: TextStyle(fontSize: 13.sp),),
                          Text("07:00-22:00",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saturday",style: TextStyle(fontSize: 13.sp),),
                          Text("09:00-17:00",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sunday",style: TextStyle(fontSize: 13.sp),),
                          Text("10:00-18:00",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 8.sp,bottom: 8.sp),
                      child: Container(
                        height: 1.h/2,
                        width: 90.w,
                        decoration:const BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("OFFICE ADRESS",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Toplita",style: TextStyle(fontSize: 13.sp),),
                          Text("Str.Stelelor 55.",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cluj",style: TextStyle(fontSize: 13.sp),),
                          Text("Str.Iazului 5.",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tg.Mures",style: TextStyle(fontSize: 13.sp),),
                          Text("Str.Viseului 15",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top: 8.sp,bottom: 8.sp),
                      child: Container(
                        height: 1.h/2,
                        width: 90.w,
                        decoration:const BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("CONTACT",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("E-mail",style: TextStyle(fontSize: 13.sp),),
                          Text("getyourselfmoving5@team.ro",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.sp,right: 13.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Telephone",style: TextStyle(fontSize: 13.sp),),
                          Text("0723214512",style: TextStyle(fontSize: 13.sp),)
                        ],
                      ),
                    ),
                  ]
              )
          ),
        )
    );
  }
}