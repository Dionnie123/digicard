import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/settings_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SettingsItem.header(leading: "Plan"),
                  const SettingsItem(
                    leading: "Digicard Free",
                    subtitle: "Contact us to upgrade your plan.",
                  ),
                  const SettingsItem.header(
                    leading: "Digicard",
                  ),
                  const SettingsItem(
                    leading: "Version",
                    trailing: "1.0.0",
                  ),
                  const Divider(height: 0),
                  const SettingsItem(
                    leading: "Developer",
                    trailing: "Global Webforce",
                  ),
                  const SettingsItem.header(
                    leading: "Digicard",
                  ),
                  SettingsItem(
                    leading: "Theme",
                    trailing: "Toggle Dark Mode",
                    onTap: () {
                      getThemeManager(context).toggleDarkLightTheme();
                    },
                  ),
                  const SettingsItem.header(leading: "Account"),
                  SettingsItem(
                    leading: "Email",
                    trailing: viewModel.email,
                  ),
                  const Divider(height: 0),
                  SettingsItem(
                    leading: "Logout",
                    onTap: () {
                      viewModel.logout();
                    },
                  ),
                ],
              ),
            )));
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
