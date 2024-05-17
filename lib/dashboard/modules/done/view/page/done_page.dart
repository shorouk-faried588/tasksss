import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksss/dashboard/modules/done/controller/done_cubit.dart';
import 'package:tasksss/dashboard/modules/done/view/component/done_item_widget.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoneCubit(),
      child: BlocBuilder<DoneCubit, DoneState>(
        builder: (context, state) {
          final DoneCubit controller = context.read<DoneCubit>();
          return Scaffold(
            body: state is DoneStateLoading
                ? const CircularProgressIndicator()
                : state is DoneStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => DoneItemWidget(
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
