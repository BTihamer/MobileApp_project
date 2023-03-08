import 'package:edzoteremappv2/UI/Screens/HomePage.dart';
import 'package:edzoteremappv2/UI/Label/LabelTextFormField.dart';
import 'package:edzoteremappv2/UI/Screens/SignInScreen.dart';
import 'package:edzoteremappv2/UI/Screens/WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
/*void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser!=null) {
      return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Car Comparison App',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home:const HomePage(),
          );
        }
      );
    }else{
      return Sizer(
          builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Car Comparison App',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,

            ),
            home:const SignInScreen(),
          );
        }
      );
    }
  }
}



