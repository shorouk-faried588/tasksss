import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasksss/dashboard/modules/done/controller/done_cubit.dart';
import 'package:tasksss/dashboard/modules/task/model/entity_model/task_model.dart';

class DoneItemWidget extends StatelessWidget {
  const DoneItemWidget({
    super.key,
    required this.taskModel,
    required this.controller,
  });

  final TaskModel taskModel;
  final DoneCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Product info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      taskModel.image ?? Uint8List(5),
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.name ?? 'Task',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        taskModel.desc ?? 'Description',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        (taskModel.availableTimes ?? 0).toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 0.5),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Like
                  InkWell(
                    child: Icon(
                      taskModel.done == 1 ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.check_mark_circled,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      if (taskModel.done == 1) {
                        controller.addItemToDone(taskModel.id ?? 0, 0);
                      } else {
                        controller.addItemToDone(taskModel.id ?? 0, 1);
                      }
                    },
                  ),

                  // Divider
                  Container(
                    
                    height: 30,
                    width: 0.5,
                    color: Colors.grey,
                    
                  ),

                  // Suspend
                  InkWell(
                    child: const Icon(
                      CupertinoIcons.stop_circle,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {
                      controller.addItemToSuspended(taskModel.id ?? 0);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
