import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem/widgets/app_bar.dart';
import 'package:sistem/widgets/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(children: [Row(children: [CardWidget(),CardWidget()],),Row(children: [CardWidget(),CardWidget()])]),
    );
  }
}