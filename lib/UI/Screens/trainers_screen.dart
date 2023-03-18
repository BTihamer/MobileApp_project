import 'package:edzoteremappv2/Models/trainer_class.dart';
import 'package:edzoteremappv2/UI/Services/trainer_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({Key? key}) : super(key: key);

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}
class _TrainersScreenState extends State<TrainersScreen> {
  TrainerProvider trainerprov=TrainerProvider();

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
                  for(int i=0;i<trainerprov.getTrainerListSize();++i) addTrainer(i)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Padding addTrainer(int index){
    Trainer trainer=trainerprov.getTrainderIndex(index);
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
                  backgroundImage: NetworkImage(trainer.photourl),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text(trainer.name,style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Location: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text(trainer.location,style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Certified: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text(trainer.certified,style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("Contact: ",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      Text(trainer.contact,style:TextStyle(fontSize: 13.sp,color: Colors.white),)
                    ],
                  ),
                      Text("Presentation:",style:TextStyle(fontSize: 13.sp,color: Colors.white54),),
                      SizedBox(
                        height: 18.h,
                          width: 65.w,
                          child: Text(trainer.presentation,textAlign:TextAlign.start,style:TextStyle(fontSize: 13.sp,color: Colors.white)))
                ],
              )
            ],
          )
      ),
    );
  }
}