import 'package:tonder/model/partner.dart';

abstract class Cache {
  Future<void> init();

  Future<bool> addToFavorite(Partner partner);
  Future<bool> addToLike(Partner partner);
  Future<bool> removeLike(Partner partner);

  Future<List<Partner>> getFavorites();
  Future<List<Partner>> getLikes();


  Future<bool> addToPass(Partner partner);
  Future<bool> removePass(Partner partner);

  Future<List<Partner>> getPass();
}