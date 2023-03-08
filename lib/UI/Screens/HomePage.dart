import 'package:edzoteremappv2/UI/Screens/SignInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  int currentIndex=0;
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser!;
    final PageController controller= PageController();
    List<String> images = [
      "https://media.istockphoto.com/id/1213615970/photo/gym-background-fitness-weight-equipment-on-empty-dark-floor.jpg?s=612x612&w=0&k=20&c=WyPxLxpfd9Pi6l0BMyWsqrrZIi_SrMmgTtYn8k08qQI=",
      "https://images.squarespace-cdn.com/content/v1/5e81f296eca8656d4cc7f9ac/1625218190083-45ABEW5ZJG5BIZRCS5O6/SwiftGym036_sr.jpg?format=2500w",
      "https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png"
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: Text('Hello '+user.email!+"!"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                   FirebaseAuth.instance.signOut();
                   Navigator.pop(context);
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const SignInScreen()),
                   );
                  },
                      child: const Text("SignOut")),
                  SizedBox(
                    width: 350.0,
                    height: 250.0,
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (index){
                        setState(() {
                          currentIndex = index.toInt() % images.length.toInt();
                        });
                      },
                        itemBuilder:(context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: Image.network(
                                  images[index%images.length],
                                  fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                    )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i=0;i<images.length;++i) buildIndicator(currentIndex==i)
                    ],
                  )
                ])
        )

    );
  }
  Widget buildIndicator(bool isSelected){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

/*class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}): super(key: key)

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMen
        ],
      ),
    ),
  );
}*/