import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgeTextField extends StatefulWidget {
  const AgeTextField({
    required this.valueController,
    super.key,
  });

  final TextEditingController valueController;

  @override
  State<AgeTextField> createState() => _AgeTextFieldState();
}

class _AgeTextFieldState extends State<AgeTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      child: TextField(
        textAlign: TextAlign.center,
        controller: widget.valueController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0x4CC9E6FF)),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0x4CC9E6FF)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}