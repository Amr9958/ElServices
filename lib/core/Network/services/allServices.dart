import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../features/home/data/allServicesmodel.dart';

class Allservices {
  Allservices() {}
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<AllServicesModel?> getAllservices() async {
    try {
      List<String> Allservices = [];
      db.collection("allServices").get().then(
        (querySnapshot) {
          log("in querySnapshot");
          for (var docSnapshot in querySnapshot.docs) {
            Allservices.add(docSnapshot.id);
            log('${docSnapshot.id} => ${docSnapshot.data()}');
            // log('****${docSnapshot}');
          }
        },
        onError: (e) => log("Error completing: $e"),
      );
      log("Allservices =>>>>>>$Allservices");
      return AllServicesModel(Allservices);
    } catch (e) {
      log(e.toString());
    }
  }
}
