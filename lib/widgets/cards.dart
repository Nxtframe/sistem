import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardWidget extends StatelessWidget {
  final int cardBgColor;
  final int quantity;
  final String businessMetric;
  const CardWidget(
      {super.key,
      this.cardBgColor = 0xFF000000,
      required this.businessMetric,
      required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(cardBgColor),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              spreadRadius: 1.0,
            )
          ]),
      child: SizedBox(
          width: 190,
          height: 150,
          child: Stack(children: [
            const Positioned(
              top: 20,
              left: 20,
              child: Icon(Icons.ac_unit_sharp, color: Colors.blue),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Text("$quantity",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            ),
            Positioned(
              top: 80,
              left: 20,
              child: Text(businessMetric,
                  style: const TextStyle(color: Colors.white)),
            ),
            const Positioned(
              top: 130,
              left: 20,
              child: Text(
                "Tap to View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ])),
    );
  }
}
