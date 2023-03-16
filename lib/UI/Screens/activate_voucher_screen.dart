import 'package:edzoteremappv2/UI/Label/label_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActivateVoucher extends StatefulWidget {
  const ActivateVoucher({ super.key });

  @override
  State<ActivateVoucher> createState() => _ActivateVoucherState();
}

class _ActivateVoucherState extends State<ActivateVoucher> {
  final activateVoucher=TextEditingController();
  final snackBar = const SnackBar(
    content: Text('If you got your Voucher correct we just activated your membership, chech "Your membeship" for more info,otherwise try again'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Activate Voucher"),
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
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: LabelTextFormField(
                      myController: activateVoucher,
                      name : "EmailTextForm",
                      obscure:false,
                      width: MediaQuery.of(context).size.width / 1.25,
                      label: "Email"),
                ),
                SizedBox(
                  height: 8.h,
                  width: 50.w,
                  child: ElevatedButton(onPressed: () {
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
}