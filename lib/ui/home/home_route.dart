import 'package:provider/provider.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/ui/home/home_bloc.dart';
import 'package:tonder/ui/home/home_view.dart';

var homeRoute = ProxyProvider<PartnerRepo, HomeBloc>(
  create: (context) {
    HomeBloc bloc = HomeBloc(
      Provider.of(
        context,
        listen: false,
      ),
    );

    bloc.init();

    return bloc;
  },
  update: (_, partner, bloc) => bloc ?? HomeBloc(partner),
  child: const HomeView(),
  dispose: (_, bloc) => bloc.dispose(),
);
