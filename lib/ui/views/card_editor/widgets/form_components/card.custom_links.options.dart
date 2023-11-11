import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/card_editor/card_editor_viewmodel.dart';

class CustomLinkOptions extends StatelessWidget {
  const CustomLinkOptions({super.key});

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardEditorViewModel>(context, listen: true);
    final formModel = viewModel.formModel;
    final colorTheme = Color(formModel.colorControl.value ?? kcPrimaryColorInt);

    final types = [];

    return Container(
      decoration: BoxDecoration(
          color: colorTheme.darken(), borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 30,
      ),
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: types.length,
        padding: const EdgeInsets.all(0),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        gridDelegate: ListItemHeightDelegate(
            crossAxisCount: isMobile(context) ? 3 : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            height: 54),
        itemBuilder: (context, index) {
          return CustomLinkButton(types[index],
              onTap: types[index].type == CustomLinkType.more
                  ? null
                  : () {
                      viewModel.addCustomLink(types[index]);
                    });
        },
      ),
    );
  }
}

class CustomLinkButton extends StatelessWidget {
  final CustomLink customLink;
  final Function()? onTap;
  const CustomLinkButton(
    this.customLink, {
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: Ink(
          child: Column(
            children: [
              const Icon(
                Icons.link,
                color: Colors.white,
                size: 25,
              ),
              vSpaceSmall,
              Center(
                child: Text(
                  customLink.label,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
