import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}
class _ChangePasswordScreenState extends State<ChangePasswordScreen>{
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
                    "Change your password",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Press to button to change your password",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                  ),
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
      content: const Text('We just sent you an e-mail to reset your password :)'),
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
    var user=FirebaseAuth.instance.currentUser;
    String? email=user!.email;
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.toString());
  }
}