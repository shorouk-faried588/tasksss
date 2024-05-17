import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  static final GlobalCubit instance=GlobalCubit();
  ThemeMode themeMode=ThemeMode.light;
  GlobalCubit() : super(GlobalInitial()){
    loadLanguage();
  }
  Map<String,dynamic> local = {};

  Future<void> loadLanguage() async {
   String s=await rootBundle.loadString('assets/lang/ar.json');
   local = json.decode(s);
 emit(GlobalInitial());
  }
  void changeMode(){
    if(themeMode==ThemeMode.dark){
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
    emit(GlobalInitial());
  }
}
