import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/card_display/card_display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';

import 'columns_separated.dart';

class ClassicCard extends StatelessWidget {
  final DigitalCardDTO card;
  final bool allowDownloadQRCode;
  const ClassicCard(
      {super.key, required this.card, required this.allowDownloadQRCode});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardDisplayModel>(context);
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
                      color: colorTheme.darken(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(card.avatarHttpUrl),
                      )),
                ),
              if (card.avatarFile != null && card.avatarFile is Uint8List)
                Container(
                  decoration: BoxDecoration(
                      color: colorTheme.darken(),
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

    Widget circleImage(BoxConstraints size) {
      return (card.logoFile == false)
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  if (card.logoUrl is String &&
                      card.logoUrl.toString().isNotEmpty)
                    Container(
                      width: size.maxWidth * 0.2,
                      height: size.maxWidth * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorTheme.darken()),
                        color: colorTheme.darken(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(card.logoHttpUrl)),
                        //   shape: BoxShape.circle,
                      ),
                    ),
                  if (card.logoFile is Uint8List && card.logoFile != null)
                    Container(
                      width: size.maxWidth * 0.2,
                      height: size.maxWidth * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorTheme.darken()),
                        color: colorTheme.darken(),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(
                            card.logoFile ?? Uint8List(0),
                          ),
                        ),
                        //     shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            );
    }

    Widget fullName() {
      return isNullEmpty(card.fullName())
          ? const SizedBox.shrink()
          : AutoSizeText(
              card.fullName(),
              maxFontSize: 26,
              minFontSize: 12,
              style: const TextStyle(
                fontSize: 26,
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                card.headline ?? "",
                textAlign: TextAlign.left,
              ),
            );
    }

    Widget customLinks() {
      return (card.customLinks ?? []).isEmpty
          ? const SizedBox.shrink()
          : ReactiveLinksBuilder(
              color: colorTheme, links: card.customLinks ?? []);
    }

    Widget qrCodeLogo() {
      return (card.logoFile is bool && card.logoFile == false) ||
              allowDownloadQRCode == false
          ? const SizedBox.shrink()
          : Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (card.logoUrl is String &&
                      card.logoUrl.toString().isNotEmpty &&
                      card.logoFile is! Uint8List)
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      child: Image.network(
                        card.logoHttpUrl,
                        width: 250 * 0.16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (card.logoFile is Uint8List)
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      child: Image.memory(
                        card.logoFile ?? Uint8List(0),
                        width: 250 * 0.16,
                        fit: BoxFit.contain,
                      ),
                    )
                ],
              ),
            );
    }

    Widget qrCode() {
      return allowDownloadQRCode == false
          ? const SizedBox.shrink()
          : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Screenshot(
                key: UniqueKey(),
                controller: viewModel.screenshotControllerDownload,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: QrImageView(
                        data: DigitalCardDTOExtension.convertToContact(card)!
                            .toVCard(withPhoto: false),
                        version: QrVersions.auto,
                        errorCorrectionLevel: QrErrorCorrectLevel.M,
                        size: 250,
                        eyeStyle: const QrEyeStyle(
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        gapless: true,
                      ),
                    ),
                    Align(alignment: Alignment.center, child: qrCodeLogo()),
                  ],
                ),
              ),
            );
    }

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile(context) ? 0 : 24.0)),
      margin: isMobile(context)
          ? const EdgeInsets.only(bottom: 15)
          : const EdgeInsets.all(15.0),
      child: LayoutBuilder(builder: (context, size) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                  circleImage(size)
                ],
              ),
            ),
            ColumnSeparated(children: [
              headline(),
              customLinks(),
              if (allowDownloadQRCode) qrCode(),
            ])
          ],
        );
      }),
    );
  }
}
