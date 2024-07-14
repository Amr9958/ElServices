import 'dart:developer';

import '../../../features/home/data/allServicesmodel.dart';
import '../services/allServices.dart';

class Repository {
  final Allservices allservices;
  Repository({required this.allservices});
  Future<AllServicesModel?> getAllServices() async {
    try {
      AllServicesModel? allServicesModel;
      allServicesModel = await allservices.getAllservices();
      return allServicesModel;
    } catch (e) {
      log(e.toString());
    }
  }
}
