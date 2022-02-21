import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/service/services.dart';
import 'package:tonder/ui/splash.dart';
import 'ui/home/home_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init component
  ///
  Network net = ApiSample();

  runApp(MyApp(net));
}

class MyApp extends StatelessWidget {
  final Network net;

  const MyApp(this.net, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Network>.value(value: net),
        ProxyProvider<Network, PartnerRepo>(
          update: (_, net, repo) => repo ?? PartnerRepo(net),
        ),
      ],
      child: MaterialApp(
        title: 'Tonder Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashView(),
      ),
    );
  }
}
