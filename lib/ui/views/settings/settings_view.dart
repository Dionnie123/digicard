import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return SplitView(
        selectedIndex: 3,
        content: PageScaffold(
          title: "SETTINGS",
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          body: const CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: Text("QR CODE")),
            ),
          ]),
        ));
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
