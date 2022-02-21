import 'package:tonder/model/partner.dart';

abstract class Network {
  Future<List<Partner>> getListPartner();
}