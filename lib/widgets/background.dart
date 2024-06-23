import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: const Stack(
        children: [
          CoffeeBean(degree: 190, right: 180, top: 90),
          CoffeeBean(degree: 90, right: -50, top: 5),
          CoffeeBean(degree: 10, right: -70, top: 150),
          CoffeeBean(degree: 120, right: -130, top: -190),
          CoffeeBean(degree: -60, right: -160, top: 80),
          CoffeeBean(degree: -40, right: 130, top: 190),
          CoffeeBean(degree: -10, right: 100, top: 80),
        ],
      ),
    );
  }
}

class CoffeeBean extends StatelessWidget {
  final double? top, left, right, bottom, degree;
  const CoffeeBean(
      {super.key, this.top, this.left, this.right, this.bottom, this.degree});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: Transform.rotate(
        angle: degree! * pi / 190,
        child: SvgPicture.asset(
          "images/coffee-bean.svg",
          width: 150,
        ),
      ),
    );
  }
}
