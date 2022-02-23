import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/service/network/network.dart';

class ApiFireStore extends Network {
  final partnerRef = FirebaseFirestore.instance
      .collection('partners')
      .withConverter<Partner>(
    fromFirestore: (snapshots, _) => Partner.fromJson(snapshots.data()!),
    toFirestore: (movie, _) => movie.toJson(),
  );


  @override
  Future<List<Partner>> getListPartner() {
    return partnerRef.get().then((snapshot) {
      return snapshot.docs.map((e) => e.data()).toList();
    });
  }
}