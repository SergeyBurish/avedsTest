import 'package:aveds_test/core/widgets/aveds_image.dart';
import 'package:flutter/material.dart';

class AvedsView extends StatelessWidget {
  final Widget child;
  final bool loading;
  const AvedsView({
    super.key, 
    required this.child,
    this.loading = false,
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
            if (loading) Positioned.fill(
              child: Container(
                color: Colors.black.withAlpha(100),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
