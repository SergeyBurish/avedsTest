import 'package:flutter/material.dart';

class AvedsImage extends StatelessWidget {
  final String name;
  const AvedsImage(
    this.name, 
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$name',
    );
  }
}