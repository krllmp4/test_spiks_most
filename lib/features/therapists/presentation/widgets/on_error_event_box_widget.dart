import 'package:flutter/material.dart';

class OnErrorEventBox extends StatelessWidget {
  const OnErrorEventBox({
    required this.message, super.key,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Text(
          'Возникла ошибка : ${message ?? 'Неизвестная ошибОчка'}'),
    );
  }
}