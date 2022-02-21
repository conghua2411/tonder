import 'package:tonder/service/services.dart';

import '../model/partner.dart';

class PartnerRepo {
  Network net;

  PartnerRepo(
    this.net,
  );

  Future<List<Partner>> getListPartner() => net.getListPartner();
}
