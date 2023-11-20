import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardPreview extends StatelessWidget {
  final Map<String, dynamic> value;
  const CardPreview({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final card = DigitalCardDTO.fromJson(value);
    final colorTheme = card.color ?? kcPrimaryColor;

    Widget squareImage() {
      return Container(
        color: colorTheme.darken(),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              if (card.avatarUrl != null && card.avatarFile != false)
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(card.avatarHttpUrl),
                  )),
                ),
              if (card.avatarFile != null && card.avatarFile is Uint8List)
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(card.avatarFile ?? Uint8List(0)),
                  )),
                ),
            ],
          ),
        ),
      );
    }

    Widget circleImage() {
      return (card.logoFile == false)
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Stack(
                children: [
                  if (card.logoUrl is String &&
                      card.logoUrl.toString().isNotEmpty)
                    CircleAvatar(
                        backgroundColor: colorTheme.darken(),
                        backgroundImage: NetworkImage(card.logoHttpUrl),
                        radius: 42.0),
                  if (card.logoFile is Uint8List && card.logoFile != null)
                    CircleAvatar(
                        backgroundColor: colorTheme.darken(),
                        backgroundImage: MemoryImage(
                          card.logoFile ?? Uint8List(0),
                        ),
                        radius: 42.0),
                ],
              ),
            );
    }

    Widget fullName() {
      return AutoSizeText(
        card.fullName(),
        maxFontSize: 24,
        minFontSize: 12,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      );
    }

    Widget position() {
      return card.position == null
          ? const SizedBox.shrink()
          : AutoSizeText(
              "${card.position}",
              maxFontSize: 15,
              minFontSize: 13,
              style: const TextStyle(
                fontSize: 15,
              ),
              maxLines: 1,
            );
    }

    Widget company() {
      return card.company == null
          ? const SizedBox.shrink()
          : AutoSizeText(
              "${card.company}",
              maxFontSize: 16,
              minFontSize: 12,
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: 1,
            );
    }

    Widget headline() {
      return card.headline == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(card.headline ?? ""),
            );
    }

    Widget circleImageForQr() {
      return (card.logoFile is bool && card.logoFile == false)
          ? const SizedBox.shrink()
          : Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Stack(
                  children: [
                    if (card.logoUrl is String &&
                        card.logoUrl.toString().isNotEmpty)
                      Image.network(
                        card.logoHttpUrl,
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                    if (card.logoFile is Uint8List)
                      Image.memory(
                        card.logoFile ?? Uint8List(0),
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      )
                  ],
                ),
              ),
            );
    }

    Widget qrCode() {
      return (card.id ?? -1) >= 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: QrImageView(
                        data: card.cardHttpUrl,
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
                    Align(
                      alignment: Alignment.center,
                      child: circleImageForQr(),
                    ),
                  ],
                ),
              ),
            );
    }

    Widget customLinks() {
      return (card.customLinks ?? []).isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: (card.customLinks ?? []).mapIndexed((index, element) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: card.color ?? kcPrimaryColor,
                            ),
                            child: const Icon(
                              Icons.email_rounded,
                              size: 25,
                            ),
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
            );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 440,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
            margin: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                squareImage(),
                Container(
                  color: colorTheme,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          fullName(),
                          position(),
                          vSpaceSmall,
                          company(),
                        ],
                      )),
                      circleImage()
                    ],
                  ),
                ),
                headline(),
                customLinks(),
                qrCode(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
