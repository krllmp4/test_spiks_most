import 'package:flutter/material.dart';

class TherapistAgeTextWidget extends StatelessWidget {
  const TherapistAgeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Возраст психолога',
      style: TextStyle(
        color: Color(0xFF1A1C1E),
        fontSize: 18,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class SessionPriceTextWidget extends StatelessWidget {
  const SessionPriceTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Стоимость сессии',
        style: TextStyle(
          color: Color(0xFF1A1C1E),
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}