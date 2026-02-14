import 'package:aveds_test/core/dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvedsTextField extends StatelessWidget {
  final String? hintText;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String val)? onChanged;
  const AvedsTextField({
    super.key,
    this.hintText,
    this.enabled = true,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        hintText: hintText,
        enabled: enabled,
      )
    );
  }
}