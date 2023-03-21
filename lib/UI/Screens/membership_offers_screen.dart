import 'package:edzoteremappv2/UI/Screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MembershipOffersScreen extends StatefulWidget {
  const MembershipOffersScreen({Key? key}) : super(key: key);

  @override
  State<MembershipOffersScreen> createState() => _MembershipOffersScreenState();
}
class _MembershipOffersScreenState extends State<MembershipOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memberships"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"189.99 RON",membership_type:"STANDARD TG MURES")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("STANDARD TG MURES",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("189.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 1 month: 189.99 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to Mures5YM,Mures5YM 2",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"189.99 RON",membership_type:"STANDARD TG MURES")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("STANDARD TOPLITA",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("189.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 1 month: 189.99 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to FormasFitnes,FormasFitnes 2",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"189.99 RON",membership_type:"STANTDARD CLUJ")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("STANTDARD CLUJ",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("189.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 1 month: 189.99 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to Cluj5YM,Cluj5YM 2",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"219.99 RON",membership_type:"NATIONAL")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("NATIONAL",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("219.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 1 month: 219.99 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to all GYM5 gyms",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"1428.00 RON",membership_type:"NATIONAL 12 months")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("NATIONAL 12 months",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("119.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 12 month: 1428.00 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to all GYM5 gyms",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.sp,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,top: 5.sp),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PaymentScreen(membership_price:"774.99 RON",membership_type:"NATIONAL 6 months")),
                    );
                  },
                  child: Container(
                    height: 17.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          color: Colors.deepPurple,
                          child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                        ),
                        Text("NATIONAL 6 months",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Row(
                            children:[
                              Text("129.99 RON/month",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(left:145.sp),
                                child: const Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ]
                        ),
                        Text("Price 6 month: 774.00 RON",style: TextStyle(fontSize: 11.sp)),
                        Text("You have acces to all GYM5 gyms",style: TextStyle(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}