import 'package:tonder/model/partner.dart';

import 'network.dart';

class ApiSample implements Network {
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
