import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_image.dart';
import 'package:aveds_test/core/widgets/aveds_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AvedsView(
      child: Padding(
        padding: EdgeInsets.only(left: Dm.s32, top: Dm.s111),
        child: AvedsImage('online_shopping.png'),
      ),
    );
  }
}