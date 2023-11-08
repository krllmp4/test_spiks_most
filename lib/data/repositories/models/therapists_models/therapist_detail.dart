import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/features/therapists/data/repository/therapist_mock_list_repository.dart';

/// Расширенная модель терапевта (Therapist)
class TherapistDetail extends Therapist {

  TherapistDetail({
    required super.id,
    required super.name,
    required super.surname,
    required super.experience,
    this.workPrinciples,
    this.biography,
    super.avatar,
    super.priceGroup,
    super.priceIndividual,
    super.mainSpecialization,
    this.additionalSpecializations,
  });
  final String? workPrinciples;
  final String? biography;
  final String? additionalSpecializations;

  static TherapistDetail getTherapist(String id){
    final Therapist therapistWithId = TherapistMockListRepository().
    list.firstWhere((therapist) => therapist.id == id);
    final therapistDetail = TherapistDetail(
      id: therapistWithId.id,
      name: therapistWithId.name,
      surname: therapistWithId.surname,
      experience: therapistWithId.experience,
      priceGroup: therapistWithId.priceGroup,
      priceIndividual: therapistWithId.priceIndividual,
      mainSpecialization: therapistWithId.mainSpecialization,
      workPrinciples: 'Я крутая',
      biography: 'Как терапевт, я верю, что важно быть эмпатичным. Моя цель - помочь вам понять себя. Мы можем вместе исследовать ваши эмоции для улучшения вашего психологического состояния. Доверьтесь мне, и вместе мы найдем путь к вашей психологической гармонии.',
      avatar: therapistWithId.avatar,
      additionalSpecializations: 'Дополнительные специализации отсутствуют',
    );
    return therapistDetail;
  }
}
