import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/ez_empty_display.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    ContactsViewModel viewModel,
    Widget? child,
  ) {
    return const SplitView(
        selectedIndex: 2,
        content: PageScaffold(
          title: "CONTACTS",
          body: EZEmptyDisplay(
            icon: Icon(Icons.error_rounded, size: 30),
            title: "Ooops! looks empty here",
          ),
        ));
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<ContactsViewModel>();
}
