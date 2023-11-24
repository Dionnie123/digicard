import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/common/theme.dark.dart';
import 'package:digicard/ui/common/theme.light.dart';
import 'package:digicard/ui/widgets/card_display/widgets/classic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'card_display_model.dart';

class CardDisplay extends StackedView<CardDisplayModel> {
  final DigitalCardDTO card;
  final bool allowAddToContacts;
  final bool allowDownloadQRCode;
  final bool allowDownloadVCF;
  const CardDisplay(this.card,
      {required this.allowAddToContacts,
      required this.allowDownloadQRCode,
      required this.allowDownloadVCF,
      super.key});

  @override
  void onViewModelReady(CardDisplayModel viewModel) {
    viewModel.card = card;
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardDisplayModel viewModel,
    Widget? child,
  ) {
    final colorTheme = card.color ?? kcPrimaryColor;

    return Theme(
      data: isDarkMode()
          ? darkTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorTheme,
                brightness: Brightness.dark,
              ).copyWith(
                brightness: Brightness.dark,
              ),
            )
          : lightTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorTheme,
                brightness: Brightness.light,
              ).copyWith(
                brightness: Brightness.light,
              ),
            ),
      child: Center(
        child: SizedBox(
          width: isMobile(context) ? double.infinity : 440,
          child: Column(
            children: [
              ClassicCard(allowDownloadQRCode: allowDownloadQRCode, card: card),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
                child: Column(
                  children: [
                    if (allowAddToContacts)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () async {
                              await viewModel.addToContacts();
                            },
                            child: const Text("Add to Contacts")),
                      ),
                    vSpaceRegular,
                    if (allowDownloadVCF)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () async {
                              await viewModel.downloadVCF();
                            },
                            child: const Text("Download VCF")),
                      ),
                    vSpaceRegular,
                    if (allowDownloadQRCode)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () {
                              viewModel.downloadQRCode(context);
                            },
                            child: const Text("Download QR")),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CardDisplayModel viewModelBuilder(BuildContext context) => CardDisplayModel();
}
