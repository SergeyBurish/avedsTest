import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'auth',
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        centerTitle: false,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => context.read<AuthCubit>().onGetCodePressed(),
          child: const Text('AuthScreen')
        )
      )
    );
  }
}