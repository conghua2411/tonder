import 'package:tonder/service/services.dart';

import '../model/partner.dart';

class PartnerRepo {
  Network net;
  Cache cache;

  PartnerRepo(
    this.net,
    this.cache,
  );

  Future<List<Partner>> getListPartner() => net.getListPartner();

  Future<List<Partner>> getLikes() => cache.getLikes();

  Future<bool> addToLike(Partner partner) => cache.addToLike(partner);

  Future<bool> removeLike(Partner partner) => cache.removeLike(partner);

  Future<List<Partner>> getPass() => cache.getPass();

  Future<bool> addToPass(Partner partner) => cache.addToPass(partner);

  Future<bool> removePass(Partner partner) => cache.removePass(partner);
}
