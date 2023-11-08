import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist_detail.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';


class TherapistBiographyTextWidget extends StatelessWidget {
  const TherapistBiographyTextWidget({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        therapistDetail.biography != null
            ? therapistDetail.biography!
            : 'Ничего важного нет',
        style: const TextStyle(
          color: Color(0xFF595959),
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class TherapistBiographyTitleWidget extends StatelessWidget {
  const TherapistBiographyTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Важное обо мне',
        style: TextStyle(
          color: Color(0xFF333333),
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class TherapistExperienceTextWidget extends StatelessWidget {
  const TherapistExperienceTextWidget({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          OutlineIcons.case_icon,
          size: 24,
        ),
        const Gap(8),
        Text(
          'Опыт работы – ${therapistDetail.experience} лет',
          style: const TextStyle(
            color: Color(0xFF595959),
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TherapistSpecializationTextWidget extends StatelessWidget {
  const TherapistSpecializationTextWidget({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return Text(
      therapistDetail.mainSpecialization != null
          ? therapistDetail.mainSpecialization!
          : 'Я псих без специализации((',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF595959),
        fontSize: 16,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class TherapistNameTextWidget extends StatelessWidget {
  const TherapistNameTextWidget({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${therapistDetail.name} ${therapistDetail.surname}',
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF333333),
        fontSize: 36,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
        height: 0.03,
      ),
    );
  }
}



class ToggleButtonContent extends StatelessWidget {
  const ToggleButtonContent({
    required this.price,
    required this.sessionType,
    super.key,
  });

  final int price;
  final String sessionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$price ₽/час',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            sessionType,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}