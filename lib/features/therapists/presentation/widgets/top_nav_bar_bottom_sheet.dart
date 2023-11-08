import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    void closeSheet() {
      Navigator.pop(context);
    }
    void resetSettings() {
      context.read<FiltersViewModel>().resetToDefault();
    }

    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 20,
        right: 20,
        bottom: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomNavBarTextButton(
              text: 'Закрыть',
              onPressed: closeSheet,
              textAlign: TextAlign.left,
          ),
          const Text(
            'Фильтры',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF191919),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomNavBarTextButton(
              text: 'Сбросить',
              onPressed: resetSettings,
              textAlign: TextAlign.right
          ),
        ],
      ),
    );
  }
}

class CustomNavBarTextButton extends StatelessWidget {
  const CustomNavBarTextButton({
    required this.text,
    required this.onPressed,
    required this.textAlign,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: textAlign,
        style: const TextStyle(
          color: Color(0xFF38B7FF),
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}