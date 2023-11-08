import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/widgets/age_textfield.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';

class AgeRangeSliderWidget extends StatelessWidget {
  const AgeRangeSliderWidget({
    super.key,
    required TextEditingController leftValueController,
    required RangeValues ageRange,
    required TextEditingController rightValueController,
  }) : _leftValueController = leftValueController, _ageRange = ageRange, _rightValueController = rightValueController;

  final TextEditingController _leftValueController;
  final RangeValues _ageRange;
  final TextEditingController _rightValueController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          AgeTextField(valueController: _leftValueController),
          const Gap(16),
          Expanded(
            child: RangeSlider(
              values: _ageRange,
              min: 18,
              max: 70,
              onChanged: (RangeValues values) {
                final minAge = values.start.round();
                final maxAge = values.end.round();
                context.read<FiltersViewModel>()
                    .updateMinAgeValue(minAge.toString());
                context
                    .read<FiltersViewModel>()
                    .updateMaxAgeValue(maxAge.toString());
                _leftValueController.text = minAge.toString();
                _rightValueController.text = maxAge.toString();
              },
              divisions: 62,
            ),
          ),
          const Gap(16),
          AgeTextField(valueController: _rightValueController),
        ],
      ),
    );
  }
}