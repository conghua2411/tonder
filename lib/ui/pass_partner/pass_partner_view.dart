import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/ui/pass_partner/pass_partner_bloc.dart';
import 'package:tonder/widget/partner_widget.dart';

class PassPartnerView extends StatefulWidget {
  const PassPartnerView({Key? key}) : super(key: key);

  @override
  _PassPartnerViewState createState() => _PassPartnerViewState();
}

class _PassPartnerViewState
    extends BaseStateBloc<PassPartnerView, PassPartnerBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pass list'),
      ),
      body: _listPass(),
    );
  }

  Widget _listPass() {
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
