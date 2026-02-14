import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aveds_test/features/auth/presentation/screen/auth_view.dart';
import 'package:aveds_test/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final inProgress = context.watch<AuthCubit>().state.inProgress;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isError) {
          _showErrorDialog(context, state.message);
        }
        if (state.codeRequestSuccess) {
          _showSnackBar(context, state.message);
        }
        if (state.codeConfirmSuccess) {
          context.router.navigate(const HomeRoute());
        }
      },
      child: Scaffold(
        body: AuthView(
          loading: inProgress,
        )
      ),
    );
  }
}
