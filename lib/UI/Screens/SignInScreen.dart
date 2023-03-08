import 'package:edzoteremappv2/UI/Screens/ForgotPasswordScreen.dart';
import 'package:edzoteremappv2/UI/Screens/HomePage.dart';
import 'package:edzoteremappv2/UI/Label/LabelTextFormField.dart';
import 'package:edzoteremappv2/UI/Screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edzoteremappv2/firebase_options.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen>{
  @override
  final navigatorKey=GlobalKey<NavigatorState>();
  final email=TextEditingController();
  final password=TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Sign In",
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
              TextButton(onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                );
              },child:const Text("Forgot Password")),
              ElevatedButton(onPressed: ()async{
                await signIn();
                if(FirebaseAuth.instance.currentUser!=null){
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
                else{
                  openDialog();
                }
              },
                  child: const Text("Submit")),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Need an account?",
                        style: TextStyle(color: Colors.deepPurple, fontSize: 15),
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },child:const Text("Sign Up")),
                  ])
            ],
          ),
        ),
      ),
    );
  }
  Future openDialog() => showDialog(
    context: context,
    builder: (contex)=> AlertDialog(
      title: Text('Wrong email/password'),
      content: Text('Please make sure you email and password are correct!'),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('OK'))
      ],
    ),
  );
  Future signIn()async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>const Center (child: CircularProgressIndicator())
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
    }on FirebaseAuthException catch (e){
      print(e);
    }
    Navigator.pop(context);
  }
}



