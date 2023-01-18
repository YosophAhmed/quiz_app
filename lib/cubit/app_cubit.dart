import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isSelected = false;

  void selectButton() {
    isSelected = !isSelected;
    emit(SelectButtonState());
  }
}