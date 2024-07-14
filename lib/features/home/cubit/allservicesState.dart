import '../data/allServicesmodel.dart';

abstract class Allservicesstate {}

class Allservicesstateinitial extends Allservicesstate {}

class Allservicesstateloading extends Allservicesstate {}

class Allservicesstatesucsess extends Allservicesstate {
  final AllServicesModel allServicesModel;

  Allservicesstatesucsess(this.allServicesModel);
}

class Allservicesstateerror extends Allservicesstate {
  final String message;

  Allservicesstateerror(this.message);
}
