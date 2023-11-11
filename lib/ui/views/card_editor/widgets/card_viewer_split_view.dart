import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card.dart';

import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';
import 'package:digicard/ui/views/card_viewer/layouts/body0.dart';
import 'package:digicard/ui/views/card_viewer/layouts/body1.dart';
import 'package:digicard/ui/views/card_viewer/layouts/heading0.dart';
import 'package:digicard/ui/views/card_viewer/layouts/heading1.dart';
import 'package:digicard/ui/views/card_viewer/widgets/app_bar_display.dart';
import 'package:digicard/ui/views/card_viewer/widgets/bottom_sheet_card.dart';
import 'package:digicard/ui/views/card_viewer/widgets/card_holder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:flutter_ez_core/widgets/scaffold_body_wrapper.dart';
import 'package:stacked/stacked.dart';

class CardViewerSplitView extends StackedView<CardViewerViewModel> {
  final DigitalCard card;
  const CardViewerSplitView({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Future<void> onViewModelReady(CardViewerViewModel viewModel) async {
    viewModel.card = card;
    viewModel.displayType = DisplayType.private;

    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardViewerViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      top: false,
      child: LayoutBuilder(builder: (context, size) {
        final cardWidth = scaffoldBodyPadding(
          size: size,
          targetWidth: 440,
        );

        return Scaffold(
          extendBodyBehindAppBar: isMobile(context) ? true : false,
          appBar: const AppBarDisplay(),
          bottomSheet: const BottomSheetCard(),
          body: ScaffoldBodyWrapper(
              isBusy: false,
              isFullWidth: true,
              isEmpty: viewModel.card.id == -1,
              emptyIndicatorWidget: const Text("EMPTY"),
              padding: cardWidth,
              builder: (context, size) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: CardHolder(
                    children: [
                      if (viewModel.card.layout == 0) const Heading0(),
                      if (viewModel.card.layout == 1) const Heading1(),
                      if (viewModel.card.layout == 0) const Body0(),
                      if (viewModel.card.layout == 1) const Body1(),
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }

  @override
  CardViewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewerViewModel();
}
