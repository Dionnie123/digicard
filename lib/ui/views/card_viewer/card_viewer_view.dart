import 'package:digicard/ui/widgets/card_display/card_display.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'card_viewer_viewmodel.dart';

class CardViewerView extends StackedView<CardViewerViewModel> {
  final String? uuid;

  const CardViewerView({@PathParam('uuid') this.uuid, Key? key})
      : super(key: key);

  @override
  Future<void> onViewModelReady(CardViewerViewModel viewModel) async {
    if (uuid != null) await viewModel.loadCardbyUuid(uuid!);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardViewerViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isBusy
        ? const Center(child: CircularProgressIndicator())
        : viewModel.card == null || uuid == null
            ? const SizedBox.shrink()
            : CardDisplay(
                viewModel.card ?? DigitalCardDTO.blank(),
                allowDownloadQRCode: true,
                allowDownloadVCF: true,
              );
  }

  @override
  CardViewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewerViewModel();
}
