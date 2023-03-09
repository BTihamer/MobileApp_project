import 'package:edzoteremappv2/UI/Screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser!;
    final PageController controller= PageController();
    List<String> images = [
      "https://media.istockphoto.com/id/1213615970/photo/gym-background-fitness-weight-equipment-on-empty-dark-floor.jpg?s=612x612&w=0&k=20&c=WyPxLxpfd9Pi6l0BMyWsqrrZIi_SrMmgTtYn8k08qQI=",
      "https://images.squarespace-cdn.com/content/v1/5e81f296eca8656d4cc7f9ac/1625218190083-45ABEW5ZJG5BIZRCS5O6/SwiftGym036_sr.jpg?format=2500w",
      "https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png"
    ];
    String helloszoveg='Hello '+user.email!+'!';
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: Text(helloszoveg),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 15.h,

                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                      boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 50)]
                  ),
                  child: Text('Hello,\n'+user.email.toString()+'!',
                  style:const TextStyle(fontSize: 20,
                      fontStyle: FontStyle.italic
                  ),
                  ),
                ),
              ),
              ListTile(
                leading:const Icon(Icons.account_circle),
                title: const Text('Profil',
                  style: TextStyle(
                    fontSize: 15,
                      fontStyle: FontStyle.italic
                  ),
                ),
                dense: true,
                  visualDensity: VisualDensity(vertical: 3),
                onTap: () {},
              ),
              ListTile(
                leading:const Icon(Icons.settings),
                title: const Text('Personal Info',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: 3),
                onTap: () {},
              ),
              ListTile(
                leading:const Icon(Icons.history),
                title: const Text('Payments History',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: 3),
                onTap: () {},
              ),
              ListTile(
                leading:const Icon(Icons.password_rounded),
                title: const Text('Change Password',
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: 3),
                onTap: () {},
              ),
              Expanded(
                child:Column(
                  children:const <Widget>[
                    Divider(
                        color: Colors.black
                    )
                  ],
                ),
              ),
              ListTile(
                  leading:const Icon(Icons.logout),
                title: const Text('SignOut',
                    style: TextStyle(
                    fontSize: 15,
                        fontStyle: FontStyle.italic
                )
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: 3),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
              ),
              ListTile(
                leading:const Icon(Icons.question_mark_rounded),
                title: const Text('About',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                    )
                ),
                dense: true,
                visualDensity: VisualDensity(vertical: 3),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
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