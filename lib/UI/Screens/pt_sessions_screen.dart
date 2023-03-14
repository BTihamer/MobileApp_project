import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PTSessionsScreen extends StatefulWidget {
  const PTSessionsScreen({Key? key}) : super(key: key);

  @override
  State<PTSessionsScreen> createState() => _PTSessionsScreenState();
}
class _PTSessionsScreenState extends State<PTSessionsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Group Training Sessions"),
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.sp),
                    child: Container(
                      width: 95.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple,width: 2.sp),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.sp)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                            child: Text("For personal training\n contact one of our trainers!",textAlign:TextAlign.center,style: TextStyle(fontSize: 18.sp,fontStyle: FontStyle.italic),))),
                  ),
                  for(int i=0;i<3;++i) addSession()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Padding addSession(){
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Container(
          height: 18.h,
          width: 95.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              color: Colors.deepPurple,
              borderRadius:
              BorderRadius.all(Radius.circular(10.sp))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 30.sp,
                  child: Text("Toplita"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Location: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Str.Stelelor 55",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Shedule: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Monday-Friday\n 18:00-20:00",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Type:",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Group,cardio",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Trainers: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Nagy Krisztina",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}