import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardPreview extends StatelessWidget {
  final DigitalCard? card;
  const CardPreview({super.key, this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 440,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                color: card?.color?.darken(0.15) ?? kcPrimaryColor.darken(0.15),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Stack(
                    children: [
                      if (card?.avatarUrl != null && card?.avatarFile != false)
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(card?.avatarHttpUrl ?? ""),
                          )),
                        ),
                      if (card?.avatarFile != null && card?.avatarFile != false)
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                MemoryImage(card?.avatarFile ?? Uint8List(0)),
                          )),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                color: card?.color ?? kcPrimaryColor,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${card?.fullName()}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        vSpaceSmall,
                        Text(
                          "${card?.position}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(width: 15),
                    CircleAvatar(
                        backgroundColor: card?.color ?? kcPrimaryColor,
                        backgroundImage: NetworkImage(card?.logoHttpUrl ?? ""),
                        radius: 50.0)
                  ],
                ),
              ),
              const SizedBox(height: 11),
              Column(
                children:
                    (card?.customLinks ?? []).mapIndexed((index, element) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_rounded,
                            size: 30,
                          ),
                          hSpaceRegular,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${element['custom'] ?? element['label']}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "${element['value']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 11),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: QrImageView(
                  data: "${Env.cardUrl}${card?.uuid}",
                  version: QrVersions.auto,
                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                  size: 200,
                  eyeStyle: const QrEyeStyle(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  gapless: true,
                ),
              ),
              /*   Stack(
                children: [
                  Positioned(
                    top: 20,
                    child:
                  )
                ],
              ) */

              /*  Text(card.toString()) */
            ],
          ),
        ),
      ),
    );
  }
}
