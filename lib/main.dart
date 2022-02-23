import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/service/services.dart';
import 'ui/home/home_route.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Cache cache = SqlCache();

  await cache.init();

  /// init component
  ///
  Network net = ApiFireStore();

  runApp(MyApp(net, cache));
}

class MyApp extends StatelessWidget {
  final Network net;
  final Cache cache;

  const MyApp(
    this.net,
    this.cache, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Network>.value(value: net),
        Provider<Cache>.value(value: cache),
        ProxyProvider2<Network, Cache, PartnerRepo>(
          update: (_, net, cache, repo) => repo ?? PartnerRepo(net, cache),
        ),
      ],
      child: MaterialApp(
        title: 'Tonder Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: homeRoute,
      ),
    );
  }
}
