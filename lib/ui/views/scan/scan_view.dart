import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:digicard/ui/widgets/ez_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'scan_viewmodel.dart';

class ScanView extends StackedView<ScanViewModel> {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScanViewModel viewModel,
    Widget? child,
  ) {
    return SplitView(
        selectedIndex: 1,
        content: PageScaffold(
          title: "SCAN",
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          bottomSheet: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: EzButton(
                title: "OPEN SCANNER",
                onPressed: () async {
                  await viewModel.openScanner();
                },
              )),
          body: const CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: Text("QR CODE")),
            ),
          ]),
        ));
  }

  @override
  ScanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScanViewModel();
}
