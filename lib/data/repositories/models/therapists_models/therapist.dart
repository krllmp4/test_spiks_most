/// Модель терапевта
/// Расширьте при необходимости

class Therapist {
  Therapist({
    required this.id,
    required this.name,
    required this.surname,
    required this.experience,
    this.avatar,
    this.mainSpecialization,
    this.age,
    this.priceIndividual,
    this.priceGroup,
  });
  final String id;
  final String name;
  final String surname;
  final String? avatar;
  final String? mainSpecialization;
  final int experience;
  final int? age;
  final int? priceIndividual;
  final int? priceGroup;
}
