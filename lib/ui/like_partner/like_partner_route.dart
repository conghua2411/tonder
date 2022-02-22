import 'package:provider/provider.dart';
import 'package:tonder/repo/partner_repo.dart';
import 'package:tonder/ui/like_partner/like_partner_bloc.dart';
import 'package:tonder/ui/like_partner/like_partner_view.dart';

var likePartnerRoute = ProxyProvider<PartnerRepo, LikePartnerBloc>(
  create: (context) {
    LikePartnerBloc bloc = LikePartnerBloc(Provider.of<PartnerRepo>(
      context,
      listen: false,
    ));
    bloc.init();
    return bloc;
  },
  update: (_, repo, bloc) => bloc ?? LikePartnerBloc(repo),
  child: const LikePartnerView(),
  dispose: (_, bloc) => bloc.dispose(),
);
