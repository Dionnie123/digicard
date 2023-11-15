import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:flutter_ez_core/widgets/ez_empty_display.dart';
import 'package:flutter_ez_core/widgets/scaffold_body_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/ui/widgets/overlays/loader_overlay_wrapper.dart';
import 'card_viewer_viewmodel.dart';
import 'layouts/body0.dart';
import 'layouts/body1.dart';
import 'layouts/heading0.dart';
import 'layouts/heading1.dart';
import 'widgets/app_bar_display.dart';
import 'widgets/bottom_sheet_card.dart';
import 'widgets/card_holder.dart';

class CardViewerView extends StackedView<CardViewerViewModel> {
  final DigitalCard? card;
  final String? uuid;
  final DisplayType? displayType;
  const CardViewerView({
    @PathParam('uuid') this.uuid,
    this.card,
    this.displayType,
    Key? key,
  }) : super(key: key);

  @override
  Future<void> onViewModelReady(CardViewerViewModel viewModel) async {
    await viewModel.start(
      cardParam: card,
      displayTypeParam: displayType,
      uuid: uuid,
    );

    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardViewerViewModel viewModel,
    Widget? child,
  ) {
    return LoaderOverlayWrapper(
        color: viewModel.color,
        type: viewModel.busy(saveBusyKey)
            ? LoadingType.save
            : viewModel.busy(deleteBusyKey)
                ? LoadingType.delete
                : viewModel.busy(doneBusyKey)
                    ? LoadingType.done
                    : null,
        builder: (context) {
          return const MainWidget();
        });
  }

  @override
  CardViewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewerViewModel();
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: true);

    Widget empty() {
      return const EZEmptyDisplay(
          icon: Icon(Icons.error_rounded), title: "Card not found");
    }

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
              emptyIndicatorWidget: empty(),
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
}
