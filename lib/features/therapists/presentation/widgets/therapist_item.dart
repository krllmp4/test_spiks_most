import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/themes/theme_class.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/core/values/icons/solid_icons.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapists_models.dart';
import 'package:flutter_spiks_test/router/app_router.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';
import 'package:flutter_spiks_test/widgets/widgets/rounded_avatar.dart';
import 'package:go_router/go_router.dart';

// @TODO доработайте widget при необходимости

class TherapistListItem extends StatelessWidget {
  const TherapistListItem({
    required this.therapist,
    this.discount,
    super.key,
  });

  final Therapist therapist;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.pushNamed(AppRouter.therapistDetailsNamed,
            params: {'therapistId': '${therapist.id}'}),
        highlightColor: context.scheme.primary.withOpacity(.2),
        child: Column(
          children: [
            therapistInfo(context),
            additionalInfo(context),
          ],
        ),
      ),
    );
  }

  Widget therapistInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedAvatar(
          therapist.avatar,
          size: 56,
        ),
        const Gap(16),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${therapist.surname} ${therapist.name}',
                          style: context.textTheme.titleLarge,
                          maxLines: 2,
                        ),
                        const Gap(4),
                        if (therapist.mainSpecialization != null)
                          Text(
                            therapist.mainSpecialization!,
                            style: _mainInfoTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Icon(
                    OutlineIcons.right,
                    color: context.scheme.onBackground,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget additionalInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 72),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          experienceInfo(),
          priceInfo(),
        ],
      ),
    );
  }

  Widget experienceInfo() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            SolidIcons.case_icon,
            size: 16,
            color: Colors.blue,
          ),
        ),
        Text(
          'Опыт работы - ${therapist.experience} лет',
          style: _mainInfoTextStyle,
        ),
      ],
    );
  }

  Widget priceInfo() {
    const priceTextStyle = TextStyle(
      color: Color(0xFF1A1C1E),
      fontSize: 18,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
    );

    if (therapist.priceGroup != null && therapist.priceIndividual != null) {
      return Text(
        'От ${min<int>(therapist.priceGroup!, therapist.priceIndividual!)}₽',
        textAlign: TextAlign.right,
        style: priceTextStyle,
      );
    } else if (therapist.priceIndividual != null) {
      return Text(
        '${therapist.priceIndividual}₽',
        textAlign: TextAlign.right,
        style: priceTextStyle,
      );
    } else if (therapist.priceGroup != null) {
      return Text(
        '${therapist.priceGroup}₽',
        textAlign: TextAlign.right,
        style: priceTextStyle,
      );
    } else {
      return const SizedBox();
    }
  }

  static const TextStyle _mainInfoTextStyle = TextStyle(
    color: Color(0xFF1A1C1E),
    fontSize: 14,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );
}
