import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/service/services.dart';

import 'partner_repo_test.mocks.dart';

@GenerateMocks([Cache, Network])
void main() {

  late MockCache cache;
  late MockNetwork network;

  late PartnerRepo repo;

  late Partner testPartner;

  setUp(() {
    cache = MockCache();
    network = MockNetwork();
    repo = PartnerRepo(network, cache);

    testPartner = Partner(
      id: '123',
      name: 'Name',
      age: 25,
      gender: 0,
      status: 1,
      image: 'https://picsum.photos/id/333/200/300',
    );
  });

  group('test partner repo', () {
    test('get list partner', () async {
      when(network.getListPartner()).thenAnswer((realInvocation) async => List.generate(
        10,
            (index) => Partner(
          id: '$index',
          name: 'Name $index',
          age: 25,
          gender: 0,
          status: 1,
          image: 'https://picsum.photos/id/333/200/300',
        ),
      ));

      expect(await repo.getListPartner(), isA<List<Partner>>());
    });

    test('like partner', () async {
      when(cache.addToLike(testPartner)).thenAnswer((realInvocation) async => true);
      expect(await repo.addToLike(testPartner), true);
    });

    test('get list like partner, but there is no record', () async {
      when(cache.getLikes()).thenAnswer((realInvocation) async => []);
      expect(await repo.getLikes(), []);
    });
  });
}