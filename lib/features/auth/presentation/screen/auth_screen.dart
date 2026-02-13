import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/features/auth/presentation/screen/auth_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthView()
    );
  }
}