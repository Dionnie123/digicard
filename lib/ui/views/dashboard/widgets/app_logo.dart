import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.6),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 14, 8),
        child: Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Image.asset(
              'assets/icons/qr.png',
              color: kcPrimaryColor,
            ),
            Text(
              "DIGICARD",
              style: const TextStyle(fontSize: 26).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
