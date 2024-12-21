import 'package:flutter/material.dart';
import 'package:technical_test_flutter_sr/common/widgets/widgets.dart';

class AGTextfieldPassword extends StatefulWidget {
  const AGTextfieldPassword({
    required this.controller,
    this.onChanged,
    this.label = '',
    super.key,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String label;

  @override
  State<AGTextfieldPassword> createState() => _AGTextfieldPasswordState();
}

class _AGTextfieldPasswordState extends State<AGTextfieldPassword> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return AGTextfield(
      controller: widget.controller,
      label: widget.label,
      onChanged: widget.onChanged,
      suffixIcon: showPassword
        ? const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blueGrey,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.blueGrey,
          ),
      onTapSuffixIcon: () => setState(() => showPassword = !showPassword),
      autocorrect: false,
      enableSuggestions: false,
      obscureText: !showPassword,
      maxLines: 1,
      prefixIcon: const Icon(
        Icons.key,
        color: Colors.blueGrey,
      ),
    );
  }
}