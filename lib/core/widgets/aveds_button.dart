import 'package:flutter/material.dart';

class AvedsButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AvedsButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFFFFC600),
        foregroundColor: Colors.black,
        fixedSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
        ],
      ),
    );
  }
}