import 'package:digicard/ui/bottom_sheets/bottom_sheet_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/common/ui_helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'image_picker_sheet_model.dart';

class ImagePickerSheet extends StackedView<ImagePickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ImagePickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImagePickerSheetModel viewModel,
    Widget? child,
  ) {
    final bool avatarMode = request.data["assetType"] == "avatar";
    final bool logoMode = request.data["assetType"] == "logo";
    final bool enableRemove = request.data["removeOption"] == true;

    return BottomSheetWrapper(
      children: <Widget>[
        if (avatarMode)
          const Text(
            "Pick Avatar Image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        if (logoMode)
          const Text(
            "Pick Logo Image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        vSpaceSmall,
        if (kIsWeb)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PanelButton(
                color: kcPrimaryColor,
                onTap: () async {
                  await viewModel.pickFromComputer();
                },
                icon: const Icon(FontAwesomeIcons.folder),
                title: "Select from Computer"),
          ),
        if (avatarMode && !kIsWeb)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PanelButton(
                color: kcPrimaryColor,
                onTap: () async {
                  await viewModel.pickFromCamera();
                },
                icon: const Icon(FontAwesomeIcons.camera),
                title: "Take from Camera"),
          ),
        if (!kIsWeb)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PanelButton(
                color: kcPrimaryColor,
                onTap: () async {
                  await viewModel.pickFromGallery();
                },
                icon: const Icon(FontAwesomeIcons.image),
                title: "Pick from Gallery"),
          ),
        if (enableRemove)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PanelButton(
                color: kcPrimaryColor,
                onTap: () async {
                  viewModel.removeImage();
                },
                icon: const Icon(FontAwesomeIcons.xmark),
                title: "Remove image"),
          ),
        PanelButton(
          color: kcPrimaryColor,
          onTap: () async {
            viewModel.cancel();
          },
          icon: const Icon(FontAwesomeIcons.ban),
          title: "Cancel",
        ),
      ],
    );
  }

  @override
  ImagePickerSheetModel viewModelBuilder(BuildContext context) =>
      ImagePickerSheetModel();
}
