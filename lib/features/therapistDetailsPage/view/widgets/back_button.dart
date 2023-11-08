import 'package:flutter/material.dart';
import 'package:flutter_spiks_test/core/values/icons/outline_icons.dart';
import 'package:flutter_spiks_test/router/app_router.dart';

class TherapistBackButton extends StatelessWidget {
  const TherapistBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      // left: 0,
      child: ElevatedButton(
        onPressed: () {
          if (AppRouter.router.canPop()) {
            AppRouter.router.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
          elevation: 0,
          backgroundColor: Colors.grey,
        ),
        child: const Icon(OutlineIcons.arrowleft),
      ),
    );
  }
}