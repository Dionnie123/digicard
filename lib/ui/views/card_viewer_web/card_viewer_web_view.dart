import 'package:digicard/ui/views/card_viewer_web/card_viewer_web_viewmodel.dart';
import 'package:digicard/ui/widgets/card_display/card_display.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:digicard/app/models/digital_card_dto.dart';

class CardViewerWebView extends StackedView<CardViewerWebViewModel> {
  final String? uuid;

  const CardViewerWebView({@PathParam('uuid') this.uuid, Key? key})
      : super(key: key);

  @override
  Future<void> onViewModelReady(CardViewerWebViewModel viewModel) async {
    if (uuid != null) await viewModel.loadCardbyUuid(uuid!);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardViewerWebViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.card == null || uuid == null
              ? const SizedBox.shrink()
              : SingleChildScrollView(
                  child: CardDisplay(
                    viewModel.card ?? DigitalCardDTO.blank(),
                    allowDownloadQRCode: true,
                    allowDownloadVCF: true,
                  ),
                ),
    );
  }

  @override
  CardViewerWebViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewerWebViewModel();
}
