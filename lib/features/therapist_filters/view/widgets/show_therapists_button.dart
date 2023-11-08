import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/features/therapists/domain/bloc/therapists_list_bloc.dart';
import 'package:flutter_spiks_test/router/app_router.dart';

class ShowTherapistsButtonWidget extends StatelessWidget {
  const ShowTherapistsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 64,
          margin: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              final filters = context.read<FiltersViewModel>().getFilters();
              context.read<TherapistsListBloc>().add(
                TherapistsListEvent.changeWithFilters(
                  filterSettings: filters,
                ),
              );
              AppRouter.router.pop();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.25,
                  color: Colors.white.withOpacity(0.4000000059604645),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              shadowColor: const Color(0x511F668E),
              elevation: 16,
            ),
            child: const Text(
              'Показать психологов',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}