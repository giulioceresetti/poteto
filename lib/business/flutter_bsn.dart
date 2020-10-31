import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poteto/dto/activity.dart';

class FlutterBsn {
  static CollectionReference activities =
      FirebaseFirestore.instance.collection('activities');
  static CollectionReference selected =
      FirebaseFirestore.instance.collection('selected');
  static CollectionReference done =
      FirebaseFirestore.instance.collection('done');

  static Future<String> addActivity(Activity act) {
    return activities.add({'activity': act.name}).then((value) {
      return "Inserita";
    }).catchError((err) {
      return "errore: $err";
    });
  }
static  Future<int > countActivities()  async {
    return  await activities.get().then((querysnapshot)  {
     return querysnapshot.size;
    });

}
  static Future<String> activityDone(Activity act) {
    activities.doc(act.name).delete().then((val) {
      done.add({'activity': act.name}).then((value) {
        return "ok fatto";
      }).catchError((err) {
        return err;
      });
    });
  }
}
