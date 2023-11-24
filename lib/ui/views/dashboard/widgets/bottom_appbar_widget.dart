import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomAppBarWidget extends StatefulWidget {
  final int? selectedIndex;

  const BottomAppBarWidget({super.key, this.selectedIndex = 0});

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[800],
      currentIndex: viewModel.currentIndex,
      onTap: (i) => viewModel.setIndex(i),
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.art_track),
        ),
        BottomNavigationBarItem(
          label: 'Scan',
          icon: Icon(Icons.art_track),
        ),
        BottomNavigationBarItem(
          label: 'Contacts',
          icon: Icon(Icons.art_track),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.art_track),
        ),
      ],
    );

    /* 
   final navigationService = locator<RouterService>();
     NavigationBar(
      onDestinationSelected: (int index) async {
        switch (index) {
          case 0:
            navigationService.navigateToHomeView();
            break;
          case 1:
            navigationService.navigateToScanView();
          case 2:
            navigationService.navigateToContactsView();
          case 3:
            navigationService.navigateToSettingsView();
          default:
        }
      },
      selectedIndex: widget.selectedIndex ?? 0,
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
    ); */
  }
}
