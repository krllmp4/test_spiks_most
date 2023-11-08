import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist.dart';
import 'package:flutter_spiks_test/features/therapists/presentation/widgets/therapist_item.dart';

class TherapistListViewWidget extends StatelessWidget {
  const TherapistListViewWidget({
    required this.therapistsList, super.key,
  });
  final List<Therapist> therapistsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: therapistsList.length,
      itemBuilder: (context, index) {
        final therapist = therapistsList[index];
        return TherapistListItem(
          therapist: therapist,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.4),
        );
      },
    );
  }
}