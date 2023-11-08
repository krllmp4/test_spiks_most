part of 'therapists_list_bloc.dart';
@freezed
class TherapistsListState with _$TherapistsListState{
  const factory TherapistsListState.loading() = _Loading;
  const factory TherapistsListState.loadedSuccessfully({List<Therapist>? therapistsList}) = _LoadedSuccessfully;
  const factory TherapistsListState.error({String? message}) = _Error;

}
