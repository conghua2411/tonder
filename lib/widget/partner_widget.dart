import 'package:flutter/material.dart';
import 'package:tonder/model/partner.dart';

class PartnerWidget extends StatelessWidget {
  final Partner partner;

  final double width, height;

  const PartnerWidget(
    this.partner, {
    Key? key,
    this.width = 200,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.network(
            '${partner.image}',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _info(partner),
          ),
        ],
      ),
    );
  }

  Widget _info(Partner partner) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.black12,
      child: Text(
        '${partner.name} ${partner.age}',style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      ),
    );
  }
}
