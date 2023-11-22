import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/card_display/widgets/classic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'card_display_model.dart';

class CardDisplay extends StackedView<CardDisplayModel> {
  final DigitalCardDTO card;
  const CardDisplay(this.card, {super.key});

  @override
  Widget builder(
    BuildContext context,
    CardDisplayModel viewModel,
    Widget? child,
  ) {
    final colorTheme = card.color ?? kcPrimaryColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 440,
          child: Column(
            children: [
              ClassicCard(card: card),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(colorTheme)),
                          onPressed: () {},
                          child: const Text("Add to Contacts")),
                    ),
                    vSpaceRegular,
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(colorTheme)),
                          onPressed: () {},
                          child: const Text("Download VCF")),
                    ),
                    vSpaceRegular,
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(colorTheme)),
                          onPressed: () {},
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
  CardDisplayModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardDisplayModel();
}
