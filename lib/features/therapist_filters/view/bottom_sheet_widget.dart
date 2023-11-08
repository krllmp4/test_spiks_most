import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/widgets/age_range_slider.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/widgets/selectable_price_card.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/widgets/show_therapists_button.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/widgets/text_widgets.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/top_nav_bar_bottom_sheet.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  late RangeValues _ageRange;
  final TextEditingController _leftValueController = TextEditingController();
  final TextEditingController _rightValueController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _ageRange = RangeValues(
      double.parse(context.read<FiltersViewModel>().minAgeValue),
      double.parse(context.read<FiltersViewModel>().maxAgeValue),
    );
    _leftValueController.text = _ageRange.start.round().toString();
    _rightValueController.text = _ageRange.end.round().toString();
    _leftValueController.addListener(() {
      final newValue = _leftValueController.text;
      context.read<FiltersViewModel>().updateMinAgeValue(newValue);
      _ageRange = RangeValues(int.parse(newValue).toDouble(), _ageRange.end);
        });
    _rightValueController.addListener(() {
      final newValue = _rightValueController.text;
      context.read<FiltersViewModel>().updateMaxAgeValue(newValue);
      _ageRange = RangeValues(_ageRange.start, int.parse(newValue).toDouble());
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      _leftValueController.text = context.read<FiltersViewModel>().minAgeValue;
      _rightValueController.text = context.read<FiltersViewModel>().maxAgeValue;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Column(
        children: [
          const TopNavBar(),
          const SessionPriceTextWidget(),
          SizedBox(
            height: 40,
            child: ListenableBuilder(
              listenable: context.watch<FiltersViewModel>(),
              builder: (BuildContext context, Widget? child) =>
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return SelectablePriceCard(index : index);
                      },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(
                        16,
                      );
                      },
                  ),
            ),
          ),
          const Gap(24),
          const TherapistAgeTextWidget(),
          AgeRangeSliderWidget(leftValueController: _leftValueController, rightValueController: _rightValueController, ageRange: _ageRange,),
          const ShowTherapistsButtonWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _leftValueController.dispose();
    _rightValueController.dispose();
    super.dispose();
  }
}


