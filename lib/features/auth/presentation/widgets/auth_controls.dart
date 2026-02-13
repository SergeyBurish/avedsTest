import 'package:aveds_test/core/dm.dart';
import 'package:aveds_test/core/widgets/aveds_button.dart';
import 'package:aveds_test/core/widgets/aveds_text_field.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthControls extends StatelessWidget {
  const AuthControls({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    return SizedBox(
      width: Dm.s328,
      child: Column(
        children: [
          AvedsTextField(
            hintText: 'Enter Email',
            onChanged: (email) => authCubit.onEmailChanged(email),
          ),
          const SizedBox(height: Dm.s11),
          const AvedsTextField(),
          const SizedBox(height: Dm.s46),
          AvedsButton(
            title: 'Get Code',
            onPressed: () => authCubit.onGetCodePressed(),
          ),
        ],
      ),
    );
  }
}