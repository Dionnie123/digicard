import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'drawer_widget.menu.dart';

class DrawerWidget extends StatelessWidget {
  final int selectedIndex;
  const DrawerWidget({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<RouterService>();
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                AppBar(
                  forceMaterialTransparency: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8.0,
                    children: [
                      Icon(Icons.qr_code),
                      Text(
                        "DIGICARD",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                DrawerMenu(
                  leading: Image.asset(
                    'assets/icons/cards.png',
                    width: 24,
                  ),
                  selected: selectedIndex == 0,
                  title: "Cards",
                  onTap: () async {
                    navigationService.replaceWithHomeView();
                  },
                ),
                const SizedBox(height: 8.0),
                DrawerMenu(
                    leading: Image.asset(
                      'assets/icons/scan.png',
                      width: 24,
                    ),
                    selected: selectedIndex == 1,
                    title: "Scan",
                    onTap: () async {
                      navigationService.replaceWithScanView();
                    }),
                const SizedBox(height: 8.0),
                DrawerMenu(
                  leading: Image.asset(
                    'assets/icons/contacts.png',
                    width: 24,
                  ),
                  selected: selectedIndex == 2,
                  title: "Contacts",
                  onTap: () async {
                    navigationService.replaceWithContactsView();
                  },
                ),
                const SizedBox(height: 8.0),
                DrawerMenu(
                  leading: Image.asset(
                    'assets/icons/settings.png',
                    width: 24,
                  ),
                  selected: selectedIndex == 3,
                  title: "Settings",
                  onTap: () async {
                    navigationService.replaceWithSettingsView();
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
