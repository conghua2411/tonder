import 'package:rxdart/rxdart.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/repo/partner_repo.dart';

class LikePartnerBloc extends BaseBloc {

  final BehaviorSubject<List<Partner>> _listPartner = BehaviorSubject();

  final PartnerRepo _partnerRepo;

  LikePartnerBloc(this._partnerRepo);

  Future<bool> init() {
    return getListLikePartner().then((value) {
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

  Future<List<Partner>> getListLikePartner() => _partnerRepo.getLikes();

  @override
  void dispose() {
    _listPartner.close();
  }
}