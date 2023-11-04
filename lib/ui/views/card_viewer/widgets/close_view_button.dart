import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CloseViewButton extends StatelessWidget {
  const CloseViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: viewModel.color.withOpacity(0.8)),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => locator<RouterService>().pop(),
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.close_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//.popUntilRouteWithPath("/"),
