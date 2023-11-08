import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({required this.priceText, required this.isSelected, super.key});

  final String priceText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: isSelected ? const Color(0xFF38B7FF) : const Color(0x4CC9E6FF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            priceText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}