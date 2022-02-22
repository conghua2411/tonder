import 'package:flutter/material.dart';
import 'package:tonder/base/base.dart';
import 'package:tonder/model/partner.dart';
import 'package:tonder/ui/home/home_bloc.dart';
import 'package:tonder/ui/like_partner/like_partner_route.dart';
import 'package:tonder/widget/control_button.dart';
import 'package:tonder/widget/image_drag_pop.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseStateBloc<HomeView, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          Center(
            child: _stackPartner(),
          ),
          _control(),
          _list(),
        ],
      ),
    );
  }

  Widget _buildPartner(Partner partner) {
    return ImageDragPop(
      '${partner.image}',
      width: MediaQuery.of(context).size.width / 10 * 8.5,
      height: MediaQuery.of(context).size.height / 10 * 7,
      onSwipeLeft: () {
        getBloc().pass(partner);
      },
      onSwipeRight: () {
        getBloc().like(partner);
      },
      onSwipeTop: () {
        getBloc().favorite(partner);
      },
      info: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.black12,
        child: Text(
          '${partner.name} ${partner.age}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _stackPartner() {
    return StreamBuilder<List<Partner>>(
      initialData: const [],
      stream: getBloc().getBsListPartner(),
      builder: (context, snapshot) {
        if (snapshot.data!.isEmpty) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 10 * 7,
          );
        }

        return Stack(
          children: convertPartnerToWidget(
            snapshot.data!,
          ),
        );
      },
    );
  }

  List<Widget> convertPartnerToWidget(List<Partner> list) {
    return list.map((p) => _buildPartner(p)).toList();
  }

  Widget _control() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 10 * 8.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pass(),
            _favorite(),
            _like(),
          ],
        ),
      ),
    );
  }

  Widget _pass() {
    return ControlButton(
      child: const Icon(
        Icons.close,
        color: Colors.green,
      ),
      borderColor: Colors.green,
      onClick: () {
        getBloc().passTop();
      },
    );
  }

  Widget _favorite() {
    return ControlButton(
      child: const Icon(
        Icons.star,
        color: Colors.blueAccent,
      ),
      borderColor: Colors.blueAccent,
      onClick: () {
        getBloc().favoriteTop();
      },
    );
  }

  Widget _like() {
    return ControlButton(
      child: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      borderColor: Colors.red,
      onClick: () {
        getBloc().likeTop();
      },
    );
  }

  Widget _list() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 10 * 8.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _listPassBtn(),
          _listLikeBtn(),
        ],
      ),
    );
  }

  Widget _listPassBtn() {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: const [
          Icon(
            Icons.close,
            color: Colors.red,
          ),
          Text(
            'Second look',
            style: TextStyle(),
          ),
        ],
      ),
    );
  }

  Widget _listLikeBtn() {
    return TextButton(
      onPressed: () {
        push(likePartnerRoute);
      },
      child: Row(
        children: const [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Text(
            'Like look',
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
