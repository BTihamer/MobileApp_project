import '../../Models/gym_class.dart';

class GymProvider{
    List<Gym> gyms=[
      Gym(
        gymName: "FormasFitnes - Toplita",
        location: "Str.Sportivilor 2A 23.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 5,
      ),
      Gym(
        gymName: "FormasFitnes 2- Toplita",
        location: "Str.Capsunilor 5.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 20,
      ),
      Gym(
        gymName: "5YM - Cluj",
        location: "Str.Inelelor 5.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 46,
      ),
      Gym(
        gymName: "Cluj5YM 2 - Cluj",
        location: "Str.Izvoarelor 53.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 74,
      ),
      Gym(
        gymName: "Mures5YM - Tg.Mures",
        location: "Str.Izvoarelor 53.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 26,
      ),
      Gym(
        gymName: "Mures5YM 2 - Tg.Mures",
        location: "Str.Cutezantei 15.",
        openBeetwin: "Open beetween 07:00-23:00",
        realtimeUsers: 54,
      ),
    ];

    Gym getGymbyindex(int index){
      return gyms[index];
    }
}