import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist_detail.dart';
import 'package:flutter_spiks_test/features/therapistDetailsPage/view/widgets/back_button.dart';
import 'package:flutter_spiks_test/features/therapistDetailsPage/view/widgets/text_widgets.dart';
import 'package:flutter_spiks_test/features/therapistDetailsPage/view/widgets/therapist_avatar.dart';
import 'package:flutter_spiks_test/features/therapistDetailsPage/view/widgets/typed_price_button.dart';
import 'package:flutter_spiks_test/widgets/gap/widgets/gap.dart';

/// Сраница подробной карточки терапевта
/// @TODO реализовать
class TherapistDetailsPage extends StatelessWidget {
  const TherapistDetailsPage({required this.therapistId, super.key});

  final String therapistId;

  TherapistDetail getTherapistById(String id) {
    return TherapistDetail.getTherapist(id);
  }

  @override
  Widget build(BuildContext context) {
    final therapistDetail = getTherapistById(therapistId);
    return Scaffold(
      body: Stack(
        children: [
          TherapistIconWidget(therapistDetail: therapistDetail),
          TherapistListSheet(therapistDetail: therapistDetail),
          const TherapistBackButton(),
        ],
      ),
    );
  }
}


class TherapistListSheet extends StatelessWidget {
  const TherapistListSheet({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.495,
      minChildSize: 0.495,
      maxChildSize: 0.9,
      builder: (context, controller) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x3D1F668E),
                blurRadius: 32,
                spreadRadius: 20,
              ),
            ],
          ),
          child: ListView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  bottom: 56,
                  right: 32,
                  left: 32,
                ),
                child: Column(
                  children: [
                    TherapistNameTextWidget(therapistDetail: therapistDetail),
                    const Gap(16),
                    TherapistSpecializationTextWidget(therapistDetail: therapistDetail),
                    TherapistExperienceTextWidget(therapistDetail: therapistDetail),
                    if (therapistDetail.priceIndividual != null &&
                        therapistDetail.priceGroup != null)
                      PriceAccordingToTypeButton(
                        therapistDetail: therapistDetail,
                      ),
                    const TherapistBiographyTitleWidget(),
                    const Gap(8),
                    TherapistBiographyTextWidget(therapistDetail: therapistDetail),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


