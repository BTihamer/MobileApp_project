import 'package:edzoteremappv2/Models/user_class.dart';
import 'package:edzoteremappv2/UI/Screens/about_screen.dart';
import 'package:edzoteremappv2/UI/Screens/activate_voucher_screen.dart';
import 'package:edzoteremappv2/UI/Screens/membership_offers_screen.dart';
import 'package:edzoteremappv2/UI/Screens/your_membership_screen_yes.dart';
import 'package:edzoteremappv2/UI/Screens/capacity_status_screen.dart';
import 'package:edzoteremappv2/UI/Screens/club_info_screen.dart';
import 'package:edzoteremappv2/UI/Screens/payment_history_screen.dart';
import 'package:edzoteremappv2/UI/Screens/profil_screen.dart';
import 'package:edzoteremappv2/UI/Screens/change_password_screen.dart';
import 'package:edzoteremappv2/UI/Screens/qrcode_screen.dart';
import 'package:edzoteremappv2/UI/Screens/pt_sessions_screen.dart';
import 'package:edzoteremappv2/UI/Screens/signin_screen.dart';
import 'package:edzoteremappv2/UI/Screens/trainers_screen.dart';
import 'package:edzoteremappv2/UI/Screens/your_membership_screen_no.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
                  visualDensity: const VisualDensity(vertical: 3),
                onTap: () async{
                  final CustomUser? user=await readUser();
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilScreen(userDB: user)),
                  );
                },
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
                visualDensity: const VisualDensity(vertical: 3),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PaymentHistory()),
                  );
                },
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
                visualDensity: const VisualDensity(vertical: 3),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                  );
                },
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
                visualDensity: const VisualDensity(vertical: 3),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
              ),//ListTile SignOut Gomb
              ListTile(
                leading:const Icon(Icons.question_mark_rounded),
                title: const Text('About',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                    )
                ),
                dense: true,
                visualDensity: const VisualDensity(vertical: 3),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
              ),//ListTile About Gomb
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:13.sp,top: 10.sp),
                      child: const Align(
                        alignment: Alignment.topLeft,
                          child: Text(
                            "CLUB ACCES",style: TextStyle(fontSize: 20),)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Container(
                        height: 14.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            color: Colors.white70,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment:Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5.sp,top: 5),
                                  child: Container(
                                  height: 8.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.deepPurple),
                                      color: Colors.deepPurple,
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(10))),
                                    child: IconButton(
                                      icon: const Icon(Icons.qr_code),
                                      onPressed: (){
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const QRCodeScreen()),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          ),
                                const Text("Member\ncard",textAlign: TextAlign.center)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:6.sp),
                              child: Column(
                                children: [
                                  Align(
                                    alignment:Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.sp,top: 5),
                                      child: Container(
                                        height: 8.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.deepPurple),
                                            color: Colors.deepPurple,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(10))),
                                        child: IconButton(
                                          icon: const Icon(Icons.info_outline_rounded),
                                          onPressed: (){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const CapacityStatusScreen()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text("Capacity\nStatus",textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:6.sp),
                              child: Column(
                                children: [
                                  Align(
                                    alignment:Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.sp,top: 5),
                                      child: Container(
                                        height: 8.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.deepPurple),
                                            color: Colors.deepPurple,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(10))),
                                        child: IconButton(
                                          icon: const Icon(Icons.location_on_outlined),
                                          onPressed: (){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const ClubInfoScreen()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text("Club\ninfo",textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:13.sp),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "YOUR SERVICES",style: TextStyle(fontSize: 20),)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Container(
                        height: 14.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            color: Colors.white70,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment:Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.sp,top: 5),
                                      child: Container(
                                        height: 8.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.deepPurple),
                                            color: Colors.deepPurple,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(10))),
                                        child: IconButton(
                                          icon: const Icon(Icons.card_membership),
                                          onPressed: (){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const MembershipOffersScreen()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text("Buy\nMembership",textAlign: TextAlign.center)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:6.sp),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.sp,top: 5),
                                        child: Container(
                                          height: 8.h,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.deepPurple),
                                              color: Colors.deepPurple,
                                              borderRadius:
                                              const BorderRadius.all(Radius.circular(10))),
                                          child: IconButton(
                                            icon: const Icon(Icons.card_membership_sharp),
                                            onPressed: ()async{
                                              bool van=true;
                                              final CustomUser? user=await readUser();
                                              if(user?.membership=="none"){
                                                van=false;
                                               }else{
                                                 van=true;
                                              }
                                              if(van==false){
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) => const NoActiveMembershipScreen()));
                                              }else {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ActiveMembershipScreen(
                                                              userDB: user,)));
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text("Your\nMembership",textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:6.sp),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.sp,top: 5),
                                        child: Container(
                                          height: 8.h,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.deepPurple),
                                              color: Colors.deepPurple,
                                              borderRadius:
                                              const BorderRadius.all(Radius.circular(10))),
                                          child: IconButton(
                                            icon: const Icon(Icons.location_on_outlined),
                                            onPressed: (){
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const ActivateVoucher()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text("Activate\nVoucher",textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:13.sp),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "PEROSNAL TRAINING",style: TextStyle(fontSize: 20),)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Container(
                        height: 14.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            color: Colors.white70,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment:Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.sp,top: 5),
                                      child: Container(
                                        height: 8.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.deepPurple),
                                            color: Colors.deepPurple,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(10))),
                                        child: IconButton(
                                          icon: const Icon(Icons.person_3_rounded),
                                          onPressed: (){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const TrainersScreen()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text("Our\nTrainers",textAlign: TextAlign.center)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:6.sp),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.sp,top: 5),
                                        child: Container(
                                          height: 8.h,
                                          width: 15.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.deepPurple),
                                              color: Colors.deepPurple,
                                              borderRadius:
                                              const BorderRadius.all(Radius.circular(10))),
                                          child: IconButton(
                                            icon: const Icon(Icons.access_time_outlined),
                                            onPressed: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => const PTSessionsScreen()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text("PT\nSessions",textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
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
                    ),
                    SizedBox(
                      height: 30.sp,
                    )
                  ])
          ),
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
Future<CustomUser?> readUser() async{
     final docUser=FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid.toString());
     final snapshot=await docUser.get();
     if(snapshot.exists){
       return CustomUser.fromJson(snapshot.data()!);
     }
     return CustomUser(name: "1", membership: "2", memb_date: DateTime.now());
   }
}