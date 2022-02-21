import 'package:tonder/model/partner.dart';

import 'network.dart';

class ApiSample extends Network {
  @override
  Future<List<Partner>> getListPartner() {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return Partner.genListSamplePartner();
      },
    );
  }
}
