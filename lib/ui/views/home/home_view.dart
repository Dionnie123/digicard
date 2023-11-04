import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    print("onViewModelReady");

    await viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  void onDispose(HomeViewModel viewModel) {
    print("DISPOSED");
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Widget floatActionButton() {
      return FloatingActionButton(
          backgroundColor: kcPrimaryColor,
          onPressed: () {
            viewModel.create();
          },
          child: const Icon(Icons.add));
    }

    return ReactiveForm(
        formGroup: viewModel.form,
        child: SplitView(
          content: PageScaffold(
              floatingActionButton: floatActionButton(),
              title: 'Cards',
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ReactiveLinksPicker(
                          formControlName: 'customLinks',
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<HomeViewModel>();
}
