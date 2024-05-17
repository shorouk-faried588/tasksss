import 'package:flutter/material.dart';
import 'package:tasksss/core/cubit/global_cubit.dart';

extension MyTheme on BuildContext{
ThemeData get getTheme=> Theme.of(this);

}
extension MyLocalization on String{
  String get tr=> GlobalCubit.instance.local[this]??toUpperCase();
}