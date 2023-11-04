import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomAppBarWidget extends StatelessWidget {
  final int? selectedIndex;

  const BottomAppBarWidget({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<RouterService>();
    return NavigationBar(
      onDestinationSelected: (int index) async {
        switch (index) {
          case 0:
            navigationService.replaceWithHomeView();
            break;
          case 1:
            navigationService.replaceWithScanView();
          case 2:
            navigationService.replaceWithContactsView();
          case 3:
            navigationService.replaceWithSettingsView();
          default:
        }
      },
      selectedIndex: selectedIndex ?? 0,
      destinations: <Widget>[
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/cards.png',
            width: 24,
          ),
          label: 'Cards',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/scan.png',
            width: 24,
          ),
          label: 'Scan',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/contacts.png',
            width: 24,
          ),
          label: 'Contacts',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/settings.png',
            width: 24,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
