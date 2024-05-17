import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksss/core/cubit/global_cubit.dart';
import 'package:tasksss/core/my_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit.instance,
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            theme: MyTheme.instance.light,
            darkTheme: MyTheme.instance.dark,
            themeMode: GlobalCubit.instance.themeMode,
            home: ItemPage(),
          );
        },
      ),
    );
  }
}
