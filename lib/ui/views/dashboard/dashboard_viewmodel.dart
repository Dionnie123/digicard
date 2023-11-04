import 'package:digicard/ui/views/contacts/contacts_view.dart';
import 'package:digicard/ui/views/home/home_view.dart';
import 'package:digicard/ui/views/scan/scan_view.dart';
import 'package:digicard/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends ReactiveViewModel {
  final _availablePages = <String, WidgetBuilder>{
    'home': (_) => const HomeView(),
    'scan': (_) => const ScanView(),
    'contacts': (_) => const ContactsView(),
    'settings': (_) => const SettingsView(),
  };

  String _selectedPageIndex = 'home';
  String get selectedPageIndex => _selectedPageIndex;

  get currentPage => _availablePages[_selectedPageIndex];

  Widget Function(BuildContext context)? getCurrentPage() {
    return _availablePages[_selectedPageIndex] ??
        (context) => const Text("fdsfsfsf");
  }

  set selectedPageIndex(String val) {
    _selectedPageIndex = val;
    rebuildUi();
  }
}
