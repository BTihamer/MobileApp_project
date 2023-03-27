import 'package:edzoteremappv2/Models/user_class.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key,required this.userDB}) : super(key: key);
  final CustomUser? userDB;
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}
class _ProfilScreenState extends State<ProfilScreen>{
  TextEditingController controller=TextEditingController();
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
                      child: Icon(Icons.person,size: 50.sp,),
                    ),
                  ),
                ),
                Center(
                  child: Text('${widget.userDB?.name}',textAlign:TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 27,)),
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
                        child:  Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${widget.userDB?.membership}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:20.sp,top:10.sp),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('${widget.userDB?.memb_date.toString()}',style: const TextStyle(fontSize: 15))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10.sp,left: 10.sp,right: 10.sp),
                  child: InkWell(
                    onTap: (){
                      openDialogYesorNo();
                    },
                    child: Container(
                      width: 95.h,
                      height: 7.h,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:10.sp),
                            child: Text('CANCEL MEMBERSHIP',style: TextStyle(fontSize: 15.sp),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            Padding(
              padding: EdgeInsets.only(top:10.sp,left: 10.sp,right: 10.sp),
              child: Container(
                width: 95.h,
                height: 7.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:10.sp),
                      child: Text('Name:'+'${widget.userDB?.name}',style: TextStyle(fontSize: 15.sp),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: TextButton(onPressed: (){
                        openDialog();
                      }, child:Text("Change",style: TextStyle(color: Colors.blue,fontSize: 15.sp),)),
                    ),
                  ],
                ),
              ),
            ),
                Padding(
                  padding: EdgeInsets.only(top:10.sp,left: 10.sp,right: 10.sp),
                  child: Container(
                    width: 95.h,
                    height: 7.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:10.sp),
                          child: Text('E-mail:'+'${FirebaseAuth.instance.currentUser?.email}',style: TextStyle(fontSize: 15.sp),),
                        ),
                      ],
                    ),
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
                          const BorderRadius.all(Radius.circular(10))),
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
                          const Center(child: Text("0")),
                        ),
                      ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right))
                          ]
                      )
                  ),
                )
            ]
          )

      ),
    );
  }
  Future cancelMembership() async{
    final docUser=FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid.toString());
    DateTime now=DateTime.now();
    await docUser.update({
      'membership': "none",
      'memb_date':now,
    });
  }
  Future openDialogYesorNo() => showDialog(
      context: context,
      builder: (contex)=> AlertDialog(
        title: const Text('Are you sure you want to cancel your membership?\nYou will lose your current membership'),
        actions: <Widget>[
          MaterialButton(
            color: Colors.red,
            textColor: Colors.white,
            child: const Text('CANCEL'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
          MaterialButton(
            color: Colors.green,
            textColor: Colors.white,
            child: const Text('OK'),
            onPressed: () {
              setState(() async{
               cancelMembership();
                Navigator.pop(context);
              });
            },
          ),
        ],
      ));
  Future openDialog() => showDialog(
  context: context,
  builder: (contex)=> AlertDialog(
      title: const Text('Enter your name:'),
      content: TextField(
        onChanged: (value) {
          setState(() {});
        },
        controller: controller,
        decoration:
        const InputDecoration(hintText: "Name:"),
      ),
      actions: <Widget>[
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          child: const Text('CANCEL'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        MaterialButton(
          color: Colors.green,
          textColor: Colors.white,
          child: const Text('OK'),
          onPressed: () {
            setState(() async{
              final docUser=FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid.toString());
              await docUser.update({
                'name':controller.text,
              });
              Navigator.pop(context);
            });
          },
        ),
      ],
    ));
}