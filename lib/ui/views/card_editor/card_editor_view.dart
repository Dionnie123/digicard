import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'card_editor_viewmodel.dart';
import 'widgets/card_viewer_split_view.dart';
import 'widgets/card_form.dart';

class CardEditorView extends StackedView<CardEditorViewModel> {
  final DigitalCard? card;
  final ActionType? actionType;
  const CardEditorView({Key? key, this.card, this.actionType})
      : super(key: key);
  @override
  Future<void> onViewModelReady(CardEditorViewModel viewModel) async {
    await viewModel.initialize(
        card ?? DigitalCard.blank(), actionType ?? ActionType.create);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CardEditorViewModel viewModel) {
    viewModel.model = DigitalCard.blank();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardEditorViewModel viewModel,
    Widget? child,
  ) {
    return DigitalCardFormBuilder(
        model: card,
        builder: (context, form, _) {
          return WillPopScope(
            onWillPop: () async {
              form.form.unfocus();
              return await viewModel.showExitDialog(form.form.pristine);
            },
            child: ReactiveValueListenableBuilder<Color?>(
                formControl: form.colorControl,
                builder: (context, color, child) {
                  final colorTheme = color.value;
                  return LoaderOverlayWrapper(
                      color: colorTheme,
                      type: viewModel.busy(saveBusyKey)
                          ? LoadingType.save
                          : viewModel.busy(doneBusyKey)
                              ? LoadingType.done
                              : null,
                      builder: (context) {
                        return isMobile(context)
                            ? const CardTabForm()
                            : Row(
                                children: [
                                  const Expanded(child: CardTabForm()),
                                  const VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                  ),
                                  Expanded(
                                    child: ReactiveDigitalCardFormConsumer(
                                        builder: (context, f, c) {
                                      return CardViewerSplitView(
                                        card: f.model,
                                      );
                                    }),
                                  )
                                ],
                              );
                      });
                }),
          );
        });
  }

  @override
  CardEditorViewModel viewModelBuilder(BuildContext context) =>
      CardEditorViewModel();
}
