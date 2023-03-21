import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Label/custom_imput_formater.dart';
import '../Label/label_text_form_field.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key,required this.membership_price,required this.membership_type}) : super(key: key);

  final String membership_price;
  final String membership_type;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;
  bool saveData=false;
  final cardName=TextEditingController();
  final cardNumber=TextEditingController();
  final expiryDate=TextEditingController();
  final securityCode=TextEditingController();
  final snackBar = const SnackBar(
    content: Text('Choose your payment option'),
  );
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.deepPurple;
      }
      return Colors.deepPurple;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(top:5.sp),
                child: Center(
                  child: Container(
                    height: 4.h,
                    color: Colors.deepPurple,
                    child: Text("Fast and advantageous",style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                  ),
                ),
              ),
              Text(
                widget.membership_type,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp
              ),
              ),
              Container(
                color: Colors.black,
                height: 1.sp,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(left:10.sp),
                child: Row(
                    children:[
                      Text("Select payment method",style: TextStyle(fontSize: 15.sp),),
                      Text("*",style: TextStyle(fontSize: 15.sp,color: Colors.red),)
                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.sp,bottom: 5.sp),
                child: Container(
                  width: 90.w,
                  height: 10.h,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Secured online reccuring payment by\nbank card:',
                          style: TextStyle(color: Colors.black,fontSize: 13.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.membership_price,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 1.sp,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: LabelTextFormField(
                    myController: cardName,
                    name : "Nameoncard",
                    obscure:false,
                    width: MediaQuery.of(context).size.width / 1.25,
                    label: "Name on Card"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.25,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:5.sp),
                      child: TextFormField(
                        controller: cardNumber,
                        obscureText: false,
                        decoration: InputDecoration(
                          label: Text("Card Number"),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          new CustomInputFormatter()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp,left: 30.sp),
                    child: LabelTextFormField(
                        myController: expiryDate,
                        name : "ExpiryDate",
                        obscure:false,
                        width: MediaQuery.of(context).size.width / 2.5,
                        label: "ExpiryDate"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp),
                    child: LabelTextFormField(
                        myController: securityCode,
                        name : "SecurityCode",
                        obscure:false,
                        width: MediaQuery.of(context).size.width / 2.5,
                        label: "Security Code"),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:5.sp,left: 50.sp),
                child: Row(
                  children: [
                    Text("Save your payment data for next time?"),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: saveData,
                      onChanged: (bool? value) {
                        setState(() {
                          saveData = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  if(isChecked==true&&saveData==true){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }else if(isChecked==true){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top:5.sp),
                  child: Container(
                    height: 10.h,
                    width:MediaQuery.of(context).size.width / 1.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: Colors.deepPurple,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left:38.sp),
                      child: Row(
                        children: [
                          Icon(Icons.lock,size: 20.sp,color: Colors.white,),
                          Text("Pay ",style: TextStyle(fontSize: 20.sp,color: Colors.white),),
                          Text(widget.membership_price,style: TextStyle(fontSize: 20.sp,color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}