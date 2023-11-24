import 'package:digicard/ui/views/contacts/contacts_view.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:digicard/ui/views/home/home_view.dart';
import 'package:digicard/ui/views/scan/scan_view.dart';
import 'package:digicard/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ScanView();
      case 2:
        return const ContactsView();
      case 3:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
        onWillPop: () async {
          viewModel.setIndex(0);
          print(viewModel.currentIndex);
          return await Future.value(false);
        },
        child: SplitView(child: getViewForIndex(viewModel.currentIndex)));
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
