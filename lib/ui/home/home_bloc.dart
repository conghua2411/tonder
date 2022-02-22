import 'package:rxdart/rxdart.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/repo/partner_repo.dart';

class HomeBloc extends BaseBloc {
  final BehaviorSubject<List<Partner>> _listPartner = BehaviorSubject();
  final PartnerRepo _partnerRepo;

  HomeBloc(this._partnerRepo);

  Future<bool> init() {
    return getListPartner().then((value) {
      return updateBsListPartner(value);
    }, onError: (e) {
      return false;
    });
  }

  BehaviorSubject<List<Partner>> getBsListPartner() => _listPartner;

  bool updateBsListPartner(List<Partner> list) {
    if (!_listPartner.isClosed) {
      _listPartner.add(list);
      return true;
    }
    return false;
  }

  Future<List<Partner>> getListPartner() => _partnerRepo.getListPartner();

  @override
  void dispose() {
    getBsListPartner().close();
  }

  Future<bool> pass(Partner partner) {
    List<Partner> list = getBsListPartner().value;
    list.remove(partner);
    updateBsListPartner(list);

    return _partnerRepo.addToPass(partner);
  }

  Future<bool> favorite(Partner partner) {
    List<Partner> list = getBsListPartner().value;
    list.remove(partner);
    updateBsListPartner(list);

    return Future.value(true);
  }

  Future<bool> like(Partner partner) {
    List<Partner> list = getBsListPartner().value;
    list.remove(partner);
    updateBsListPartner(list);

    return _partnerRepo.addToLike(partner);
  }

  Future<bool> passTop() {
    Partner partner = getBsListPartner().value.last;
    return pass(partner);
  }

  Future<bool> favoriteTop() {
    Partner partner = getBsListPartner().value.last;
    return favorite(partner);
  }

  Future<bool> likeTop() {
    Partner partner = getBsListPartner().value.last;
    return like(partner);
  }
}
