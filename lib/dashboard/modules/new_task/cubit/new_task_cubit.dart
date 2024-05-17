import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasksss/dashboard/modules/task/controller/task_cubit.dart';
import 'package:tasksss/dashboard/modules/task/model/repo/database_repo.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(NewTaskInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController tmsController = TextEditingController();
  XFile? image;
  Future<void> pickTaskImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewTaskInitial());
  }

  Future<void> takeTaskImage() async {
    final ImagePicker picker = ImagePicker();
// take an image.
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewTaskInitial());
  }

  Future<void> addTask(context) async {
    DatabaseRepo db = DatabaseRepo();
    db.initDB();
    db.insertTask(
      nameController.text,
      descController.text,
      0,
      int.parse(tmsController.text),
      await image!.readAsBytes(),
    );
    await TaskCubit.instance.init();
    Navigator.pop(context);
  }
}
