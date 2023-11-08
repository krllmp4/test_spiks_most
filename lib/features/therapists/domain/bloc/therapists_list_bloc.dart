import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spiks_test/data/repositories/models/filter_model/filter.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/features/therapists/domain/repository/therapist_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'therapists_list_bloc.freezed.dart';

part 'therapists_list_event.dart';

part 'therapists_list_state.dart';

class TherapistsListBloc
    extends Bloc<TherapistsListEvent, TherapistsListState> {
  TherapistsListBloc(this._repository) : super(const _Loading()) {
    on<_ChangeFilters>(_onChangeFilters);
    on<_ChangeWithFilters>(_onChangeWithFilters);
  }

  final TherapistListRepository _repository;

  Future<void> _onChangeFilters(
    _ChangeFilters event,
    Emitter<TherapistsListState> emit,
  ) async {
    emit(const _Loading());
    try {
      final therapistsList = await _repository.fetchTherapistsList();
      emit(_LoadedSuccessfully(therapistsList: therapistsList));
    } catch (e) {
      log('Error $e occured during loading');
      emit(_Error(message: e.toString()));
    }
  }

  Future<void> _onChangeWithFilters(
    _ChangeWithFilters event,
    Emitter<TherapistsListState> emit,
  ) async {
    emit(const _Loading());
    try {
      final filterSettings = event.filterSettings;
      final therapistsList =
          await _repository.fetchTherapistsListWithFilters(filterSettings);
      emit(_LoadedSuccessfully(therapistsList: therapistsList));
    } catch (e) {
      log('Error $e occured during loading');
      emit(_Error(message: e.toString()));
    }
  }
}
