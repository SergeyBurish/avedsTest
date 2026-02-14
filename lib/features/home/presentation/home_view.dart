import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_image.dart';
import 'package:aveds_test/core/widgets/aveds_view.dart';
import 'package:aveds_test/features/home/presentation/widgets/home_controls.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final bool loading;
  const HomeView({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    return AvedsView(
      loading: loading,
      child: const Column(
        spacing: Dm.s11,
        children: [
          SizedBox(
            width: 390,
            height: Dm.s111,
          ),
          AvedsImage('online_shopping.png'),
          HomeControls(),
        ],
      ),
    );
  }
}