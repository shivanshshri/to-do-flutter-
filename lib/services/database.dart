
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
// Function to add a to-do item for today
  Future addTodayWork(Map<String,dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("today")
        .doc(id)
        .set(userTodayMap);
  }

// Function to add a to-do item for tomorrow
  Future addTomorrowWork(Map<String,dynamic> userTomorrowMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("tomorrow")
        .doc(id)
        .set(userTomorrowMap);

  }

// Function to add a to-do item for next week
  Future addNextWeekWork(Map<String,dynamic> userNextWeekMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("nextweek")
        .doc(id)
        .set(userNextWeekMap);
  }

// Function to get all work based on the day (today, tomorrow, nextweek)
  Stream getAllTheWork(String day) {
    return FirebaseFirestore.instance.collection(day).snapshots();
  }

// Function to update the 'yes' field if a to-do item is ticked
  Future updateIfTicked(String id, String day) async {
    return await FirebaseFirestore.instance
        .collection(day)
        .doc(id)
        .update({"Yes": true});
  }
}



