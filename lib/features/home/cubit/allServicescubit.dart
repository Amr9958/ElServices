import 'dart:developer';

import 'package:Elservices/core/Network/repository/Repository.dart';
import 'package:Elservices/features/home/cubit/allservicesState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/allServicesmodel.dart';

class Allservicescubit extends Cubit<Allservicesstate> {
  final Repository repository;

  Allservicescubit(this.repository) : super(Allservicesstateinitial());
  Future<void> getAllServices() async {
    try {
      emit(Allservicesstateloading());
      AllServicesModel? allServicesModel;
      allServicesModel = await repository.allservices.getAllservices();
      emit(Allservicesstatesucsess(allServicesModel!));
    } catch (e) {
      log(e.toString());
      emit(Allservicesstateerror(e.toString()));
    }
  }
}
