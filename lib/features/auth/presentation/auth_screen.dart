import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('AuthScreen')
      )
    );
  }
}