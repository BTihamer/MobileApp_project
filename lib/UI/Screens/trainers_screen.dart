import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({Key? key}) : super(key: key);

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}
class _TrainersScreenState extends State<TrainersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Our Partner Trainers"),
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
          height: 35.h,
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
                  child: const Icon(Icons.person),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Nagy Janos",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Location: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Toplita",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Certified: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("Level 1/online coach",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Contact: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text("nagyjanos@gym5.ro",style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                      Text("Presentation:",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      SizedBox(
                        height: 18.h,
                          width: 65.w,
                          child: Text("I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",textAlign:TextAlign.start,style:TextStyle(fontSize: 13.sp,color: Colors.white)))
                ],
              )
            ],
          )
      ),
    );
  }
}