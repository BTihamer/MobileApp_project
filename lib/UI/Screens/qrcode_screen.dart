import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}
class _QRCodeScreenState extends State<QRCodeScreen> {
  final sendEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Here is your own QRCode"),
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
              Padding(
                padding: EdgeInsets.only(bottom: 30.sp),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 45.h,
                    height: 45.h,
                    decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                        BorderRadius.all(Radius.circular(5))),
                    child: QrImage(
                        data: FirebaseAuth.instance.currentUser!.uid.toString(),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 90.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 13.sp),
                    child: Text("If you already have an membership\nJust scan this QRCode at the entrance\nHave fun in the GYM!",style: TextStyle(fontSize: 20.sp),textAlign: TextAlign.center,),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}