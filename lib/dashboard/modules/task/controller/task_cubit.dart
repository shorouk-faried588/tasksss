import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasksss/dashboard/modules/task/model/entity_model/task_model.dart';
import 'package:tasksss/dashboard/modules/task/model/repo/database_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  static TaskCubit instance = TaskCubit();

  TaskCubit() : super(TaskStateLoading()) {
    init();
  }

  List<TaskModel> tasks = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(TaskStateLoading());
    await repo.initDB();
    tasks = await repo.fetchTasks();
    if (tasks.isEmpty) {
      emit(TaskStateEmpty());
    } else {
      emit(TaskStateLoaded());
    }
  }

  void addItemToDone(int id, int value) {
    repo.updateDone(value, id);
    init();
    emit(TaskStateLoaded());
  }

  void addItemToSuspended(int id) {
    repo.updateSuspended(1, id);
    emit(TaskStateLoaded());
  }
}
