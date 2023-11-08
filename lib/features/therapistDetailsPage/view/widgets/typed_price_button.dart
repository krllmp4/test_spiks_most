import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist_detail.dart';
import 'package:flutter_spiks_test/features/therapistDetailsPage/view/widgets/text_widgets.dart';

class PriceAccordingToTypeButton extends StatefulWidget {
  const PriceAccordingToTypeButton({required this.therapistDetail, super.key});
  final TherapistDetail therapistDetail;

  @override
  State<PriceAccordingToTypeButton> createState() =>
      _PriceAccordingToTypeButtonState();
}

class _PriceAccordingToTypeButtonState
    extends State<PriceAccordingToTypeButton> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ToggleButtons(
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _isSelected.length; i++) {
                if (i == index) {
                  _isSelected[i] = true;
                } else {
                  _isSelected[i] = false;
                }
              }
            });
          },
          borderRadius: BorderRadius.circular(20),
          selectedColor: Colors.white,
          fillColor: const Color(0xFF38B7FF),
          color: const Color(0xFF006492),
          children: [
            ToggleButtonContent(
              price: widget.therapistDetail.priceIndividual!,
              sessionType: 'индивидуальная',
            ),
            ToggleButtonContent(
              price: widget.therapistDetail.priceGroup!,
              sessionType: 'для пары',
            ),
          ],
        ),
      ),
    );
  }
}