

import 'package:edzoteremappv2/Models/sessions_class.dart';

class SessionsProvider{
  List<Session> sessions=[
    Session(
        trainer: "Nagy Olivia",
        location: "Str.Sportivillor 2A 23",
        city: "Toplita",
        shedule: "Monday-Friday\n18:00-20:00",
        type: "Group,cardio"
    ),
    Session(
        trainer: "Bacs Andras",
        location: "Str.Inelelor 5.",
        city: "Cluj",
        shedule: "Monday-Friday\n18:00-20:00",
        type: "Group,cardio"
    ),
    Session(
        trainer: "Bacs Andras",
        location: "Str.Izvoarelor 53.",
        city: "Tg.Mures",
        shedule: "Monday-Friday\n18:00-20:00",
        type: "Group,cardio"
    ),
    Session(
        trainer: "Bacs Andras",
        location: "Str.Izvoarelor 53.",
        city: "Tg.Mures",
        shedule: "Saturday-Sunday\n15:00-17:00",
        type: "Group,cardio"
    ),
  ];

  Session getSessionbyindex(int index){
    return sessions[index];
  }
  int getSessionsnumber(){
    return sessions.length;
  }
}