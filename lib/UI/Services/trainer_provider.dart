import '../../Models/trainer_class.dart';

class TrainerProvider{
  List<Trainer> trainers=[
    Trainer(
        name: "Nagy Janos",
      location: "Toplita",
        certified: "level 1/online coach",
      contact: "nagyjanos@gym5.ro",
        photourl: "https://e7.pngegg.com/pngimages/348/866/png-clipart-personal-trainer-fitness-centre-physical-fitness-strength-and-conditioning-coach-others-miscellaneous-tshirt.png",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
    Trainer(
      name: "Nagy Olivia",
      location: "Toplita",
      certified: "level 2/online coach",
      contact: "nagyolivia@gym5.ro",
      photourl: "https://w7.pngwing.com/pngs/390/31/png-transparent-exercise-physical-fitness-fitness-centre-personal-trainer-general-fitness-training-others-exercise-physical-fitness-fitness-centre-thumbnail.png",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
    Trainer(
      name: "Bacs Andras",
      location: "Cluj",
      certified: "level 2/online coach",
      contact: "bacsandras@gym5.ro",
      photourl: "https://png.pngitem.com/pimgs/s/416-4164531_parallel-fitness-identity-design-personal-trainer-hd-png.png",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
    Trainer(
      name: "Malansi Beata",
      location: "Cluj",
      certified: "level 1/online coach",
      contact: "malansibea@gym5.ro",
      photourl: "https://cdn.imgbin.com/1/11/10/imgbin-physical-fitness-fitness-professional-body-for-life-exercise-personal-trainer-workaholic-XJEvxaUB8MmcxHa6UNCpHKKHa.jpg",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
    Trainer(
      name: "Pap Laszlo",
      location: "Tg.Mures",
      certified: "level 2/online coach",
      contact: "paplaszlo@gym5.ro",
      photourl: "https://w7.pngwing.com/pngs/529/271/png-transparent-panagiotis-giannakis-t-shirt-arm-shoulder-professional-fitness-coach-tshirt-physical-fitness-arm.png",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
    Trainer(
      name: "Pasztor Kristof",
      location: "Tg.Mures",
      certified: "level 2/online coach",
      contact: "pasztorkrisz@gym5.ro",
      photourl: "https://w7.pngwing.com/pngs/14/38/png-transparent-kostas-hatzichristos-basketball-coach-pbc-cska-moscow-basketball-tshirt-hand-development.png",
      presentation: "I care deeply about my clients,\n and there’s nothing of more value to me than helping somebody go through an experience that makes them happy, confident, and strong",
    ),
  ];
  Trainer getTrainderIndex(int index){
    return trainers[index];
  }
  int getTrainerListSize(){
    return trainers.length;
  }
}