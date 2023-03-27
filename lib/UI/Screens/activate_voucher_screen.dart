import 'package:edzoteremappv2/Models/user_class.dart';
import 'package:edzoteremappv2/UI/Label/label_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivateVoucher extends StatefulWidget {
  const ActivateVoucher({ super.key });

  @override
  State<ActivateVoucher> createState() => _ActivateVoucherState();
}

class _ActivateVoucherState extends State<ActivateVoucher> {
  final activateVoucher = TextEditingController();
  final snackBar = const SnackBar(
    content: Text(
        'If you got your Voucher correct we just activated your membership, chech "Your membeship" for more info,otherwise try again'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activate Voucher"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Enter your voucher\nIt looks like: 0000-0000-0000",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: LabelTextFormField(
                      myController: activateVoucher,
                      name: "EmailTextForm",
                      obscure: false,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.25,
                      label: "Code"),
                ),
                SizedBox(
                  height: 8.h,
                  width: 50.w,
                  child: ElevatedButton(onPressed: () {
                    activVoucher(activateVoucher.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  },
                      child: const Text("Activate Voucher")),
                ),
              ]
          ),
        ),
      ),
    );
  }
  void activVoucher(String code) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(
        FirebaseAuth.instance.currentUser?.uid.toString());
    DateTime ?now;
    final snapshot = await docUser.get();
    final user = CustomUser.fromJson(snapshot.data()!);
    final docVoucher=FirebaseFirestore.instance.collection('Voucher').doc(activateVoucher.toString());
    final snapshotvoucher=await docVoucher.get();
    if(snapshotvoucher.exists){
      if (user?.membership == "STANDARD TOPLITA" ||
        user?.membership == "STANDARD TG MURES" ||
        user?.membership == "STANDARD CLUJ") {
      now = user?.memb_date.add(const Duration(days: 30));
    }
      else if (user?.membership == "NATIONAL 12 months") {
      now = user?.memb_date.add(const Duration(days: 360));
    }
      else if (user?.membership == "NATIONAL 6 months") {
      now = user?.memb_date.add(const Duration(days: 180));
    }else if(user?.membership=="none"){
        now = user?.memb_date.add(const Duration(days: 360));
        await docUser.update({
          'membership':"NATIONAL 12 months",
          'memb_date':now,
        });
        return;
      }
    await docUser.update({
      'memb_date': now,
    });
  }
}
}