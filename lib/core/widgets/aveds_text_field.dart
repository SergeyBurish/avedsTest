import 'package:aveds_test/core/dm.dart';
import 'package:flutter/material.dart';

class AvedsTextField extends StatelessWidget {
  final String? hintText;
  final void Function(String val)? onChanged;
  const AvedsTextField({
    super.key,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        hintText: hintText
      )
    );
  }
}