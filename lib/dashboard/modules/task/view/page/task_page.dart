import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksss/dashboard/modules/task/controller/task_cubit.dart';
import 'package:tasksss/dashboard/modules/task/view/component/task_item_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TaskCubit.instance,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          final TaskCubit controller = context.read<TaskCubit>();
          return Scaffold(
            body: state is TaskStateLoading
                ? const CircularProgressIndicator()
                : state is TaskStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => TaskItemWidget(
                          taskModel: controller.tasks[index],
                          controller: controller,
                        ),
                        itemCount: controller.tasks.length,
                      ),
          );
        },
      ),
    );
  }
}
