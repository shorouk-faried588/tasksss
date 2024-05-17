import 'dart:developer';
import 'dart:typed_data';

class TaskModel {
  String? name, desc;
  int? done, suspended, id, availableTimes, times;
  Uint8List? image;

  TaskModel.fromJson(Map m) {
    log(m.toString());
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    times = m['times'];
    availableTimes = m['availableTimes'];
    suspended = m['suspended'];
    done = m['done'];
    id = m['id'];
  }
}
