import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_button.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aveds_test/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeControls extends StatelessWidget {
  const HomeControls({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    final userId = context.watch<AuthCubit>().state.userId;
    return SizedBox(
      width: Dm.s328,
      child: Column(
        spacing: Dm.s11,
        children: [
          const Text('Authorised'),
          Text(
            'User ID: $userId',
            textAlign: TextAlign.center,
          ),
          AvedsButton(
            title: 'Refresh',
            onPressed: authCubit.onRefresh
          ),
          AvedsButton(
            title: 'Logout',
            onPressed: () {
              authCubit.logout();
              context.router.replace(const AuthRoute());
            },
          ),
        ],
      ),
    );
  }
}