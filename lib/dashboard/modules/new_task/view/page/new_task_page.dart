import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksss/dashboard/modules/new_task/cubit/new_task_cubit.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaskCubit(),
      child: BlocBuilder<NewTaskCubit, NewTaskState>(
        builder: (context, state) {
          final NewTaskCubit cubit = context.read<NewTaskCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Add new task'),
            ),
            body: Column(
              children: [
                ///name
                const Text('Name'),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: cubit.nameController,
                ),

                ///description
                const Text('Description'),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: cubit.descController,
                ),

                const Text('Remained times'),

                ///description
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: cubit.tmsController,
                ),

                Row(
                  children: [
                    IconButton(onPressed: cubit.pickTaskImage, icon: const Icon(CupertinoIcons.photo)),
                    IconButton(onPressed: cubit.takeTaskImage, icon: const Icon(CupertinoIcons.camera)),
                  ],
                ),

                if (cubit.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      File(cubit.image!.path),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                const Spacer(),
                TextButton(onPressed: () => cubit.addTask(context), child: const Text("add task"))
              ],
            ),
          );
        },
      ),
    );
  }
}
