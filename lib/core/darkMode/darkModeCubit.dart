import 'dart:developer';

import 'package:Elservices/core/darkMode/darkModeStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dark_lightModeCubit extends Cubit<Dark_lightModeState> {
  Dark_lightModeCubit() : super(initialtModeState());
  String mode = '';
  void darkAndlightMode(String onpressMode) {
    if (onpressMode == 'light') {
      mode = 'light';
      emit(LightModeState());
    } else {
      mode = 'dark';
      emit(DarkModeState());
    }
  }
}
