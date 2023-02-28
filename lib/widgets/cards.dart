import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: const [Flexible(child: Text("KK")),Flexible(child: Text("KK")),Flexible(child: Text("KK"))]),
    );
  }
}