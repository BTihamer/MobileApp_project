import 'package:edzoteremappv2/UI/Label/label_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>{
  final sendEmail=TextEditingController();
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
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Password Reset",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: LabelTextFormField(
                      myController: sendEmail,
                      name : "EmailTextForm",
                      obscure:false,
                      width: MediaQuery.of(context).size.width / 1.25,
                      label: "Email"),
                ),
                ElevatedButton(onPressed: () async{
                  await resetPassword();
                },
                    child: const Text("Send Email")),
              ]
          ),
        ),
      ),
    );
  }
  Future openDialog() => showDialog(
    context: context,
    builder: (contex)=> AlertDialog(
      title: const Text('Password Reset'),
      content: const Text('If we got an account with your e-mail,we sent you and password reset e-mail.Check your e-mail!'),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
          Navigator.pop(context);
        }, child: const Text('OK'))
      ],
    ),
  );
  Future resetPassword() async{
    openDialog();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: sendEmail.text.trim());
  }
}