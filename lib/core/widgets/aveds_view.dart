import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_image.dart';
import 'package:flutter/material.dart';

class AvedsView extends StatelessWidget {
  final Widget child;
  const AvedsView({
    super.key, 
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            const AvedsImage('ellipse_48.png'),
            const Positioned(
              right: 0,
              child: AvedsImage('ellipse_47.png'),
            ),
            child,
          ],
        ),
      ],
    );
  }
}