import 'package:auto_size_text/auto_size_text.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class Heading0 extends StatelessWidget {
  const Heading0({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: true);
    const avatarSize = 160.0;
    Widget logoField() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: AnimatedOpacity(
          opacity: viewModel.card.logoFile != null ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            height: 56,
            decoration: viewModel.card.logoFile != null
                ? BoxDecoration(
                    image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: MemoryImage(
                      viewModel.card.logoFile ?? Uint8List(0),
                    ),
                    fit: BoxFit.contain,
                  ))
                : null,
          ),
        ),
      );
    }

    Widget avatarFieldCircle() {
      return AnimatedOpacity(
        key: UniqueKey(),
        opacity: viewModel.card.avatarFile != null ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: viewModel.card.avatarFile == null
            ? const SizedBox(
                height: avatarSize,
                width: avatarSize,
              )
            : Container(
                height: avatarSize,
                width: avatarSize,
                decoration: BoxDecoration(
                    color: viewModel.color.darken(),
                    border: Border.all(color: viewModel.color, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                      image: MemoryImage(
                        viewModel.card.avatarFile ?? Uint8List(0),
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
      );
    }

    Widget fullNameField() {
      return viewModel.card.firstName.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AutoSizeText(
                viewModel.card.fullName().sanitize().toTitleCase(),
                style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 30,
                  height: 1.2,
                ).copyWith(
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                maxFontSize: 30,
                minFontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : const SizedBox.shrink();
    }

    Widget positionField() {
      return viewModel.card.position.isNotEmpty
          ? AutoSizeText(
              viewModel.card.position.sanitize().toTitleCase(),
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
            )
          : const SizedBox.shrink();
    }

    Widget companyField() {
      return viewModel.card.company.isNotEmpty
          ? AutoSizeText(
              viewModel.card.company.sanitize().toTitleCase(),
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
            )
          : const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: (avatarSize / 2) - 15),
      child: LayoutBuilder(builder: (context, size) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: size.maxWidth,
              constraints: const BoxConstraints(minHeight: 260),
              decoration: BoxDecoration(
                color: viewModel.color,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  15.0,
                  56,
                  15,
                  (avatarSize / 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logoField(),
                    fullNameField(),
                    SizedBox(
                      width: size.maxWidth - (avatarSize + 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          positionField(),
                          companyField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 0 - (avatarSize / 2) + 20,
              child: avatarFieldCircle(),
            ),
          ],
        );
      }),
    );
  }
}