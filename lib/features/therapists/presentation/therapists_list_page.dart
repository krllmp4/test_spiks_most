import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/data/repositories/models/filter_model/filter.dart';
import 'package:flutter_spiks_test/features/therapist_filters/view_model/filters_view_model.dart';
import 'package:flutter_spiks_test/features/therapists/domain/bloc/therapists_list_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/appbar_therapists_list.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/empty_therapist_list_widget.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/on_error_event_box_widget.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapist_list_view_widget.dart';
import 'package:provider/provider.dart';

/// Страница просмотра списка терапевтов
/// @TODO реализовать
class TherapistsListPage extends StatefulWidget {
  const TherapistsListPage({super.key});

  @override
  State<TherapistsListPage> createState() => _TherapistsListPageState();
}

class _TherapistsListPageState extends State<TherapistsListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<TherapistsListBloc>()
        ..add(
          TherapistsListEvent.changeFilters(
            filterSettings: FilterSettings(),
          ),
        ),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => FiltersViewModel(),
        child: Scaffold(
          appBar: const AppbarTherapists(),
          body: BlocBuilder<TherapistsListBloc, TherapistsListState>(
            builder: (BuildContext context, TherapistsListState state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loadedSuccessfully: (therapistsList) {
                  if (therapistsList == null || therapistsList.isEmpty) {
                    return const EmptyTherapistListWidget();
                  } else {
                    return TherapistListViewWidget(therapistsList: therapistsList,
                    );
                  }
                },
                error: (message) {
                  return OnErrorEventBox(message: message,);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}



