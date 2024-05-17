import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasksss/dashboard/modules/task/controller/task_cubit.dart';
import 'package:tasksss/dashboard/modules/task/model/entity_model/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel,
    required this.controller,
  });
  final TaskModel taskModel;
  final TaskCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            
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
                  
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.name ?? 'task',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        taskModel.desc ?? 'description',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  
                  ),
                   const Spacer(),
                  Column(
                    children: [
                      
                      Text((taskModel.availableTimes ?? 0).toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                        ),
                ],
              ),
              const Divider(
                thickness: 0.5,
              ),

              ///actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ///like
                  InkWell(
                    child: taskModel.done == 1
                        ? const Icon(
                            CupertinoIcons.check_mark_circled_solid,
                            color: Colors.blue,
                          )
                        : const Icon(
                        
                            CupertinoIcons.check_mark_circled,
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

                  ///divider
                  Container(
                    height: 30,
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  
                  ///missed
                  InkWell(
                    child: taskModel.suspended == 1
                        ? const Icon(
                            CupertinoIcons.stop_circle_fill,
                            color: Colors.greenAccent,
                          
                          )
                        : const Icon(
                            CupertinoIcons.stop_circle,
                            color: Colors.greenAccent,
                          ),
                          
                          
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
            ],
        ),
      ),
      )
    );
  }
}
