import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/features/therapists/domain/bloc/therapists_list_bloc.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view/bottom_sheet_widget.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:provider/provider.dart';


class AppbarTherapists extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTherapists({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    double bottomSheetHeightCalc() {
      final screenHeight = MediaQuery.of(context).size.height;
      final appBarHeight = preferredSize.height;
      final bottomSheetHeight = screenHeight - appBarHeight;
      return bottomSheetHeight;
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
      child: AppBar(
        title: Text(S.of(context).therapists),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(OutlineIcons.settings),
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SizedBox(
                    height: bottomSheetHeightCalc(),
                    child: ChangeNotifierProvider.value(
                      value: context.read<FiltersViewModel>(),
                      child: BlocProvider.value(
                        value: context.read<TherapistsListBloc>(),
                        child: const BottomSheetContent(
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
