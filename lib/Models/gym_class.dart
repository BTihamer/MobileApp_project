

class Gym{
  final String gymName;
  final String location;
  final String openBeetwin;
  int realtimeUsers;
  Gym({required this.gymName,required this.location,required this.openBeetwin,required this.realtimeUsers});

  set setRealtimeUsers(int users) {
    realtimeUsers = users;
  }
}