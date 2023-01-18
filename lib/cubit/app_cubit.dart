import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/constants/colors.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  Color trueColor = AppColors.color['trueAnswerColor']!;
  Color falseColor = AppColors.color['falseAnswerColor']!;

  bool isPressed = false;
  bool isTrue = false;

  void emitState() {
    if (isPressed == true) {
      emit(NoSelectState());
      if (isTrue == true) {
        emit(SelectTrueAnswerState());
      } else {
        emit(SelectFalseAnswerState());
      }
    }
  }
}
