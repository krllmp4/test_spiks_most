import 'dart:math';

import 'package:flutter_spiks_test/data/repositories/models/filter_model/filter.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';

import 'package:flutter_spiks_test/features/therapists/domain/repository/therapist_list_repository.dart';

class TherapistMockListRepository implements TherapistListRepository{
  final List<Therapist> list = [
    Therapist(id: '1', name: 'Эмилия', surname: 'Кларк', experience: 8, avatar: 'https://i.pravatar.cc/150?img=1', mainSpecialization: 'Перинатальный психолог', priceGroup: 3000, priceIndividual: 2500, age: 20),
    Therapist(id: '2', name: 'Абра', surname: 'Кадабра', experience: 7, avatar: 'https://i.pravatar.cc/150?img=2', mainSpecialization: 'Духовный психолог', priceGroup: 5000, age: 69),
    Therapist(id: '3', name: 'Лина', surname: 'Пить', experience: 6, avatar: 'https://i.pravatar.cc/150?img=3', mainSpecialization: 'Интересный психолог', priceIndividual: 1000, age: 37),
    Therapist(id: '4', name: 'Колумб', surname: 'Христофор', experience: 5, avatar: 'https://i.pravatar.cc/150?img=4', mainSpecialization: 'Просто психолог', priceGroup: 7000, priceIndividual: 5500, age: 50),
    Therapist(id: '5', name: 'Бубу', surname: 'Бебе', experience: 4, avatar: 'https://i.pravatar.cc/150?img=5', mainSpecialization: 'Бубу психолог', age:18, priceIndividual: 500),
    Therapist(id: '6', name: 'Абра', surname: 'Кадабра', experience: 7, avatar: 'https://i.pravatar.cc/150?img=6', mainSpecialization: 'Пеленальный психолог',  priceGroup: 100, priceIndividual: 50, age: 70),
    Therapist(id: '7', name: 'Пила', surname: 'Лить', experience: 6, avatar: 'https://i.pravatar.cc/150?img=7', priceGroup: 1100, priceIndividual: 1000, age: 31),
    Therapist(id: '8', name: 'Ник', surname: 'Светофор', experience: 5, avatar: 'https://i.pravatar.cc/150?img=8', mainSpecialization: 'Ориентальный психолог', priceGroup: 1200, priceIndividual: 700, age: 27),
    Therapist(id: '9', name: 'Хиха', surname: 'Хуха', experience: 4, avatar: 'https://i.pravatar.cc/150?img=9', priceGroup: 9000, priceIndividual: 85000, age: 21),
    Therapist(id: '10', name: 'Авада', surname: 'Кабабра', experience: 7, avatar: 'https://i.pravatar.cc/150?img=10', mainSpecialization: 'Не психолог', priceGroup: 100000, priceIndividual: 50000, age: 44),
    Therapist(id: '11', name: 'Эмилия', surname: 'Кларк', experience: 8, avatar: 'https://i.pravatar.cc/150?img=11', mainSpecialization: 'Я психолог', priceGroup: 10, priceIndividual: 5, age: 55),
    Therapist(id: '12', name: 'Ла', surname: 'Поть', experience: 6, avatar: 'https://i.pravatar.cc/150?img=12', mainSpecialization: 'Крутой психолог', priceGroup: 4200, priceIndividual: 2502, age: 68),
    Therapist(id: '13', name: 'Коля', surname: 'Христ', experience: 5, avatar: 'https://i.pravatar.cc/150?img=13', mainSpecialization: 'Школьный психолог', priceGroup: 3000, priceIndividual: 2503, age: 65),
    Therapist(id: '14', name: 'Ббу', surname: 'Ббе', experience: 4, avatar: 'https://i.pravatar.cc/150?img=14', mainSpecialization: 'Гейский психолог', priceGroup: 3000, priceIndividual: 2501, age: 18),
    Therapist(id: '15', name: 'Эмилия', surname: 'Кларк', experience: 8, avatar: 'https://i.pravatar.cc/150?img=15', mainSpecialization: 'Некрутой психолог', priceGroup: 3000, priceIndividual: 2550, age: 19),
  ];
  @override
  Future<List<Therapist>> fetchTherapistsList() async {
    await Future.delayed(const Duration(seconds: 2));
    return list;
  }
  @override
  Future<List<Therapist>> fetchTherapistsListWithFilters(FilterSettings filterSettings) async {
    int? minPrice(Therapist therapist) {
      if (therapist.priceIndividual != null && therapist.priceGroup != null) {
        final minPrice = min(therapist.priceIndividual!, therapist.priceGroup!);
        return minPrice;
      } else if (therapist.priceIndividual != null) {
        return therapist.priceIndividual;
      } else if (therapist.priceGroup != null) {
        return therapist.priceGroup;
      }
    }
    int? maxPrice(Therapist therapist) {
      if (therapist.priceIndividual != null && therapist.priceGroup != null) {
        final minPrice = max(therapist.priceIndividual!, therapist.priceGroup!);
        return minPrice;
      } else if (therapist.priceIndividual != null) {
        return therapist.priceIndividual;
      } else if (therapist.priceGroup != null) {
        return therapist.priceGroup;
      }
    }
    final List<Therapist> therapistListFiltered = list.where((therapist){
      final min = minPrice(therapist);
      final max = maxPrice(therapist);
      return therapist.age!= null && therapist.age! >= filterSettings.minAgeValue && therapist.age! <= filterSettings.maxAgeValue &&
          (therapist.priceIndividual!= null || therapist.priceGroup !=null) &&  min! >= filterSettings.minPrice && max! <= filterSettings.maxPrice;
    }).toList();
    await Future.delayed(const Duration(seconds: 2));
    return therapistListFiltered;

  }
}