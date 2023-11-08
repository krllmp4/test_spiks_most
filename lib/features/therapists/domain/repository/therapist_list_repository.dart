import 'package:flutter_spiks_test/data/repositories/models/filter_model/filter.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';

abstract class TherapistListRepository{
  Future<List<Therapist>> fetchTherapistsList();
  Future<List<Therapist>> fetchTherapistsListWithFilters(FilterSettings filterSettings);
}