part of 'therapists_list_bloc.dart';
@freezed
class TherapistsListEvent with _$TherapistsListEvent{
  const factory TherapistsListEvent.changeFilters({
      required FilterSettings filterSettings,
    }) = _ChangeFilters;
  const factory TherapistsListEvent.changeWithFilters({
    required FilterSettings filterSettings,
}) = _ChangeWithFilters;
}
