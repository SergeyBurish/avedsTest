import 'package:aveds_test/core/dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvedsTextField extends StatelessWidget {
  final String? hintText;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final void Function(String val)? onChanged;
  final bool Function()? validator;
  const AvedsTextField({
    super.key,
    this.hintText,
    this.enabled = true,
    this.inputFormatters,
    this.errorText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(Dm.s8)),
        ),
        hintText: hintText,
        enabled: enabled,
        errorText: _errorText(),
      ),
    );
  }

  String? _errorText() {
    if (validator == null) return null;
    return validator!() ? null : errorText;
  }
}