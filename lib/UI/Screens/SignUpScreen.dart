import 'dart:ui';

import 'package:edzoteremappv2/UI/Label/LabelTextFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>{
  @override
  final navigatorKey=GlobalKey<NavigatorState>();
  final email=TextEditingController();
  final password=TextEditingController();
  final Confirm_password=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: BackButton(
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
                  "SignUp",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: LabelTextFormField(
                    myController: email,
                    name : "EmailTextForm",
                    obscure:false,
                    width: MediaQuery.of(context).size.width / 1.25,
                    label: "Email"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: LabelTextFormField(
                    myController: password,
                    name : "PasswordTextForm",
                    obscure: true,
                    width: MediaQuery.of(context).size.width / 1.25,
                    label: "Password"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: LabelTextFormField(
                    myController: Confirm_password,
                    name : "ConfrimPasswordTextForm",
                    obscure: true,
                    width: MediaQuery.of(context).size.width / 1.25,
                    label: "Confrim Password"),
              ),
              ElevatedButton(onPressed: (){
                if(password.text==Confirm_password.text){
                  signUp();
                  Navigator.pop(context);
                }
              },
                  child: const Text("SignUp")),
            ]
          ),
        ),
      ),
    );
  }
  Future signUp() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>const Center (child: CircularProgressIndicator())
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
    }on FirebaseAuthException catch (e){
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) =>route.isFirst);
  }
}
