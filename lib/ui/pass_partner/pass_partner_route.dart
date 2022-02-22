import 'package:provider/provider.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/ui/pass_partner/pass_partner_bloc.dart';
import 'package:tonder/ui/pass_partner/pass_partner_view.dart';

var passPartnerRoute = ProxyProvider<PartnerRepo, PassPartnerBloc>(
  create: (context) {
    PassPartnerBloc bloc = PassPartnerBloc(Provider.of<PartnerRepo>(
      context,
      listen: false,
    ));
    bloc.init();
    return bloc;
  },
  update: (_, repo, bloc) => bloc ?? PassPartnerBloc(repo),
  child: const PassPartnerView(),
  dispose: (_, bloc) => bloc.dispose(),
);
