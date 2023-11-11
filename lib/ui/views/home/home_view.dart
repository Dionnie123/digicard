import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:digicard/ui/widgets/digital_card_list_item/digital_card_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => true;

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
            body: ScaffoldListWrapper(
              isBusy: viewModel.isBusy,
              emptyIndicatorWidget: const EZEmptyDisplay(
                icon: Icons.card_giftcard_rounded,
                title: "Ooops! looks empty here",
              ),
              onRefresh: () async {
                await viewModel.init();
              },
              itemCount: viewModel.digitalCards.length,
              builder: (context, constraints) {
                return GridView.builder(
                  gridDelegate: ListItemHeightDelegate(
                      crossAxisCount: isMobile(context) ? 2 : 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      height: 242),
                  itemCount: viewModel.digitalCards.length,
                  padding: const EdgeInsets.all(15),
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  itemBuilder: (context, index) {
                    return DigitalCardListItem(
                      onTap: () {
                        viewModel.show(viewModel.digitalCards[index]);
                      },
                      card: viewModel.digitalCards[index],
                    );
                  },
                );
              },
            ),
          ),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<HomeViewModel>();
}
