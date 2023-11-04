import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return const Text("WEWE");
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
