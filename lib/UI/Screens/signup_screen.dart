import 'package:edzoteremappv2/UI/Label/label_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen>{

  final navigatorKey=GlobalKey<NavigatorState>();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmPassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:100,bottom: 30),
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
                      myController: confirmPassword,
                      name : "ConfrimPasswordTextForm",
                      obscure: true,
                      width: MediaQuery.of(context).size.width / 1.25,
                      label: "Confrim Password"),
                ),
                ElevatedButton(onPressed: ()async{
                  if(password.text==confirmPassword.text){
                    signUp();
                    Navigator.pop(context);
                  }
                },
                    child: const Text("SignUp")),
              ]
            ),
          ),
        ),
      ),
    );
  }
  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
    }on FirebaseAuthException catch (e){
      print(e);
    }
    Navigator.pop(context);
  }
}
