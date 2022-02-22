import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/ui/like_partner/like_partner_bloc.dart';
import 'package:tonder/widget/partner_widget.dart';

class LikePartnerView extends StatefulWidget {
  const LikePartnerView({Key? key}) : super(key: key);

  @override
  _LikePartnerViewState createState() => _LikePartnerViewState();
}

class _LikePartnerViewState
    extends BaseStateBloc<LikePartnerView, LikePartnerBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like list'),
      ),
      body: _listLike(),
    );
  }

  Widget _listLike() {
    return StreamBuilder<List<Partner>>(
      initialData: const [],
      stream: getBloc().getBsListPartner(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PartnerWidget(
                snapshot.data![index],
                height: 300,
                width: double.infinity,
              ),
            );
          },
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}
