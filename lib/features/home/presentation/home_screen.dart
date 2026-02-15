import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aveds_test/features/home/presentation/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('error'.tr()),
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final inProgress = context.watch<AuthCubit>().state.inProgress;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.error) {
          _showErrorDialog(context, state.message);
        }
        if (state.getUserDataSuccess) {
          _showSnackBar(context, state.message);
        }
      },
      child: Scaffold(
        body: HomeView(
          loading: inProgress,
        )
      ),
    );
  }
}
