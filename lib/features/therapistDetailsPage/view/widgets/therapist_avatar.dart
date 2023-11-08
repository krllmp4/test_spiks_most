import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/data/repositories/models/therapists_models/therapist_detail.dart';

class TherapistIconWidget extends StatelessWidget {
  const TherapistIconWidget({
    required this.therapistDetail, super.key,
  });

  final TherapistDetail therapistDetail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.495,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: therapistDetail.avatar != null
                ? NetworkImage(therapistDetail.avatar!)
                : const NetworkImage('https://i.pravatar.cc/150?img=20'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}