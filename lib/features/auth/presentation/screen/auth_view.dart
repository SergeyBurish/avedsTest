import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_image.dart';
import 'package:aveds_test/core/widgets/aveds_view.dart';
import 'package:aveds_test/features/auth/presentation/widgets/auth_controls.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AvedsView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dm.s58, top: Dm.s184),
            child: AvedsImage('mini_shop.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: Dm.s26, top: Dm.s51),
            child: AuthControls(),
          ),
        ],
      ),
    );
  }
}