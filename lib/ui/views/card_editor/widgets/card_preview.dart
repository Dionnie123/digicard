import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';

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
                        radius: 42),
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
      return isNullEmpty(card.fullName())
          ? const SizedBox.shrink()
          : AutoSizeText(
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
      return isNullEmpty(card.position)
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
      return isNullEmpty(card.company)
          ? const SizedBox.shrink()
          : Padding(
              padding:
                  EdgeInsets.only(top: isNullEmpty(card.position) ? 0.0 : 8.0),
              child: AutoSizeText(
                "${card.company}",
                maxFontSize: 16,
                minFontSize: 12,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 1,
              ),
            );
    }

    Widget headline() {
      return isNullEmpty(card.headline)
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                card.headline ?? "",
                textAlign: TextAlign.left,
              ),
            );
    }

    Widget imageForQr() {
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
      return (card.id == null)
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
                      child: imageForQr(),
                    ),
                  ],
                ),
              ),
            );
    }

    Widget customLinks() {
      return LinksBuilder(color: colorTheme, links: card.customLinks ?? []);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 440,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
            margin: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                squareImage(),
                Container(
                  color: colorTheme,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          fullName(),
                          position(),
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
