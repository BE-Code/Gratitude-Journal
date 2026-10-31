import 'package:flutter/cupertino.dart';
import 'package:moodairy/helpers/db_helper.dart';
import 'package:moodairy/helpers/mooddata.dart';
import 'package:moodairy/models/activity.dart';

class MoodCard extends ChangeNotifier {
  List<String> activityname = [];
  List<String> activityimage = [];
  List<MoodData> data = [];
  bool isloading = false;
  List<String> actiname = [];

  void add(Activity act) {
    activityimage.add(act.image);
    activityname.add(act.name);
    notifyListeners();
  }

  Future<void> addPlace(String datetime, String mood, String image,
      String actimage, String actname, String date) async {
    await DBHelper.insert('user_moods', {
      'datetime': datetime,
      'mood': mood,
      'image': image,
      'actimage': actimage,
      'actname': actname,
      'date': date
    });
    notifyListeners();
  }

  Future<void> deletePlaces(String datetime) async {
    DBHelper.delete(datetime);
    notifyListeners();
  }
}
