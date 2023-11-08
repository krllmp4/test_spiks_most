
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/core/values/enum_values/session_price_range_enum.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/price_card_bottom_sheet.dart';

class SelectablePriceCard extends StatelessWidget {
  const SelectablePriceCard({
    required this.index, super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FiltersViewModel>()
            .updateCurrentPrice(PriceRangeEnum.values[index]);
      },
      child: PriceCard(
        priceText: PriceRangeEnum.values[index].uiName(),
        isSelected: PriceRangeEnum.values[index] ==
            context.read<FiltersViewModel>().currentPrice,
      ),
    );
  }
}