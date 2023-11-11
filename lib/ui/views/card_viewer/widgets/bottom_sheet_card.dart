import 'package:digicard/app/constants/stacked_keys.dart';

import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:flutter_ez_core/widgets/ez_button.dart';
import 'package:stacked/stacked.dart';
import 'ad_panel.dart';
import 'own_button.dart';

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: true);

    return LayoutBuilder(builder: (context, size) {
      final cardWidth = scaffoldBodyPadding(size: size, targetWidth: 450);
      return Container(
        padding: cardWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (viewModel.displayType == DisplayType.public &&
                  viewModel.isCardOwnedByUser())
                const OwnButton(),
              vSpaceSmall,
              if (viewModel.card.id != -1)
                Row(
                  children: [
                    if (!viewModel.isCardOwnedByUser() &&
                        !viewModel.isCardInContacts() &&
                        viewModel.isUserPresent())
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: EzButton(
                            backgroundColor: viewModel.color,
                            title: "Add to Contacts",
                            onPressed: () async {
                              await viewModel.saveToContacts();
                            },
                          ),
                        ),
                      ),
                    if (kIsWeb && viewModel.displayType == DisplayType.public)
                      Expanded(
                        child: EzButton(
                          backgroundColor: viewModel.color,
                          title: "Download Contact",
                          onPressed: () async {
                            await viewModel.downloadVcf();
                          },
                        ),
                      ),
                  ],
                ),
              vSpaceSmall,
              if (kIsWeb && viewModel.displayType == DisplayType.public)
                const AdPanel()
            ],
          ),
        ),
      );
    });
  }
}
