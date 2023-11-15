import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({Key? key}) : super(key: key);

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
          body: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: Text("QR CODE")),
            ),
          ]),
        ));
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
