import 'package:cloud_firestore/cloud_firestore.dart';
class CustomUser{
  String name;
  String membership;
  DateTime memb_date;
  static CustomUser ?user;
  CustomUser({required  this.name,required  this.membership,required this.memb_date});


  static CustomUser? fromJson(Map<String,dynamic> json) {
    return CustomUser(
      name: json['name'],
      membership: json['membership'],
      memb_date: (json['memb_date'] as Timestamp).toDate(),
    );
  }
  void updateUser(String userId)async{
    final db=FirebaseFirestore.instance.collection('Users').doc(userId);
    final snapshot=await db.get();
    final userDB=CustomUser.fromJson(snapshot.data()!);
  }
}