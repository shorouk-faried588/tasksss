import 'dart:developer';
import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:tasksss/dashboard/modules/task/model/entity_model/task_model.dart';

class DatabaseRepo {
  late Database myObjectDB;

  Future<void> initDB() async {
    // databaseFactory = databaseFactoryFfiWeb;
    myObjectDB = await openDatabase(
      '${await getDatabasesPath()}/taskDB.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE task (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            description TEXT, 
            image BLOB,
            times INTEGER,
            availableTimes INTEGER,
            done INTEGER,
            missed INTEGER
          )''');
      },
    );
  }

  Future<List<TaskModel>> fetchTasks() async {
    log('Fetching tasks');
    return (await myObjectDB.query('task')).map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<List<TaskModel>> fetchDoneTasks() async {
    log('Fetching done tasks');
    return (await myObjectDB.query('task', where: 'done=?', whereArgs: [1]))
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  Future<List<TaskModel>> fetchSuspendedTasks() async {
    log('Fetching suspended tasks');
    return (await myObjectDB.query('task', where: 'suspended=?', whereArgs: [1]))
        .map((e) => TaskModel.fromJson(e))
        .toList();
  }

  Future<void> insertTask(String name, String desc, int times, int availableTimes, Uint8List image) async {
    log('Inserting task: $name');
    await myObjectDB.insert('task', {
      'name': name,
      'description': desc,
      'times': times,
      'availableTimes': availableTimes,
      'image': image,
      'done': 0,
      'suspended': 0,
    });
  }

  void newTimes(int tms, int id) {
    log('Updating times for task id: $id');
    myObjectDB.update(
      'task',
      {'availableTimes': tms},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  void updatemissed(int value, int id) {
    log('Updating suspended status for task id: $id');
    myObjectDB.update(
      'task',
      {'suspended': value},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> updateDone(int value, int id) async {
    log('Updating done status for task id: $id');
    await myObjectDB.update(
      'task',
      {'done': value},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  void deleteTask(int id) {
    log('Deleting task with id: $id');
    myObjectDB.delete('task', where: 'id=?', whereArgs: [id]);
  }

  void updateSuspended(int i, int id) {}
}
