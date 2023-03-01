import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1)),
      child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
              children: const [
                Positioned(child: Icon(Icons.ac_unit_sharp),
                top: 20,left: 20,),
              ])),
    );
  }
}
