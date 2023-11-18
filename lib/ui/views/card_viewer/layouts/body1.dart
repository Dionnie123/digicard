import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';
import 'package:digicard/ui/views/card_viewer/widgets/card_items.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Body1 extends StatelessWidget {
  const Body1({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: true);

    final cardItems = CardItems(context, color: viewModel.color);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 300,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cardItems.fullName(viewModel.card.fullName()),
            cardItems.position(viewModel.card.position.toString()),
            cardItems.company(viewModel.card.company.toString()),
            cardItems.headline(viewModel.card.headline.toString()),
            // cardItems.customLinks(viewModel.card?.customLinks),
            if (viewModel.isCardOwnedByUser())
              cardItems.dateCreated(viewModel.card.createdAt),
            if (viewModel.isCardInContacts())
              cardItems.dateCreated(viewModel.card.addedToContactsAt)
          ],
        ),
      ),
    );
  }
}
