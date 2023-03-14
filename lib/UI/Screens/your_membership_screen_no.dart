import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoActiveMembershipScreen extends StatelessWidget {
  const NoActiveMembershipScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CLUB INFO"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60.sp,
                        backgroundColor: Colors.red.shade900,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40.sp),
                              child: Align(
                                alignment: Alignment.center,
                                  child: Icon(Icons.card_membership,size: 40.sp,)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:60.sp),
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: Colors.red,
                                child:const Icon(Icons.close),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top:10.sp),
                    child: Text("YOU DON\'T HAVE A\n MEMBERSHIP",style: TextStyle(color: Colors.red,fontSize: 30.sp,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:10.sp),
                    child: Text("How come you don\'t have a membership? GO BUY ONE!",style: TextStyle(color: Colors.black,fontSize: 15.sp,),textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:10.sp),
                    child: SizedBox(
                      height: 8.h,
                      width: 50.w,
                      child: ElevatedButton(onPressed:(){
                        //bedob majd a buymembership screen-re meg nincs kesz
                      },
                          child: const Text("BUY MEMBERSHIP")),
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}