// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:stacked/stacked.dart' as _i12;
import 'package:stacked_services/stacked_services.dart' as _i11;

import '../ui/views/auth/auth_view.dart' as _i2;
import '../ui/views/card_editor/card_editor_view.dart' as _i6;
import '../ui/views/card_viewer/card_viewer_view.dart' as _i7;
import '../ui/views/contacts/contacts_view.dart' as _i4;
import '../ui/views/dashboard/dashboard_view.dart' as _i10;
import '../ui/views/forgot_password/forgot_password_view.dart' as _i8;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/scan/scan_view.dart' as _i9;
import '../ui/views/settings/settings_view.dart' as _i5;
import '../ui/views/startup/startup_view.dart' as _i1;
import 'constants/stacked_keys.dart' as _i15;
import 'models/digital_card_dto.dart' as _i14;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i11.StackedService.navigatorKey);

class StackedRouterWeb extends _i12.RootStackRouter {
  StackedRouterWeb({_i13.GlobalKey<_i13.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    AuthViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        transitionsBuilder: _i12.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactsViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ContactsView(),
        transitionsBuilder: _i12.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsView(),
        transitionsBuilder: _i12.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CardEditorViewRoute.name: (routeData) {
      final args = routeData.argsAs<CardEditorViewArgs>(
          orElse: () => const CardEditorViewArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.CardEditorView(
          key: args.key,
          card: args.card,
          actionType: args.actionType,
        ),
      );
    },
    CardViewerViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardViewerViewArgs>(
          orElse: () => CardViewerViewArgs(uuid: pathParams.optString('uuid')));
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.CardViewerView(
          uuid: args.uuid,
          key: args.key,
        ),
      );
    },
    ForgotPasswordViewRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordViewArgs>(
          orElse: () => const ForgotPasswordViewArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ForgotPasswordView(
          key: args.key,
          fromLink: args.fromLink,
        ),
      );
    },
    ScanViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ScanView(),
        transitionsBuilder: _i12.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DashboardView(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          AuthViewRoute.name,
          path: '/auth-view',
        ),
        _i12.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i12.RouteConfig(
          ContactsViewRoute.name,
          path: '/contacts-view',
        ),
        _i12.RouteConfig(
          SettingsViewRoute.name,
          path: '/settings-view',
        ),
        _i12.RouteConfig(
          CardEditorViewRoute.name,
          path: '/card-editor-view',
        ),
        _i12.RouteConfig(
          CardViewerViewRoute.name,
          path: '/p/:uuid',
        ),
        _i12.RouteConfig(
          ForgotPasswordViewRoute.name,
          path: '/forgot-password-view',
        ),
        _i12.RouteConfig(
          ScanViewRoute.name,
          path: '/scan-view',
        ),
        _i12.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i12.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.AuthView]
class AuthViewRoute extends _i12.PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i12.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.ContactsView]
class ContactsViewRoute extends _i12.PageRouteInfo<void> {
  const ContactsViewRoute()
      : super(
          ContactsViewRoute.name,
          path: '/contacts-view',
        );

  static const String name = 'ContactsView';
}

/// generated route for
/// [_i5.SettingsView]
class SettingsViewRoute extends _i12.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: '/settings-view',
        );

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i6.CardEditorView]
class CardEditorViewRoute extends _i12.PageRouteInfo<CardEditorViewArgs> {
  CardEditorViewRoute({
    _i13.Key? key,
    _i14.DigitalCardDTO? card,
    _i15.ActionType? actionType,
  }) : super(
          CardEditorViewRoute.name,
          path: '/card-editor-view',
          args: CardEditorViewArgs(
            key: key,
            card: card,
            actionType: actionType,
          ),
        );

  static const String name = 'CardEditorView';
}

class CardEditorViewArgs {
  const CardEditorViewArgs({
    this.key,
    this.card,
    this.actionType,
  });

  final _i13.Key? key;

  final _i14.DigitalCardDTO? card;

  final _i15.ActionType? actionType;

  @override
  String toString() {
    return 'CardEditorViewArgs{key: $key, card: $card, actionType: $actionType}';
  }
}

/// generated route for
/// [_i7.CardViewerView]
class CardViewerViewRoute extends _i12.PageRouteInfo<CardViewerViewArgs> {
  CardViewerViewRoute({
    String? uuid,
    _i13.Key? key,
  }) : super(
          CardViewerViewRoute.name,
          path: '/p/:uuid',
          args: CardViewerViewArgs(
            uuid: uuid,
            key: key,
          ),
          rawPathParams: {'uuid': uuid},
        );

  static const String name = 'CardViewerView';
}

class CardViewerViewArgs {
  const CardViewerViewArgs({
    this.uuid,
    this.key,
  });

  final String? uuid;

  final _i13.Key? key;

  @override
  String toString() {
    return 'CardViewerViewArgs{uuid: $uuid, key: $key}';
  }
}

/// generated route for
/// [_i8.ForgotPasswordView]
class ForgotPasswordViewRoute
    extends _i12.PageRouteInfo<ForgotPasswordViewArgs> {
  ForgotPasswordViewRoute({
    _i13.Key? key,
    bool fromLink = false,
  }) : super(
          ForgotPasswordViewRoute.name,
          path: '/forgot-password-view',
          args: ForgotPasswordViewArgs(
            key: key,
            fromLink: fromLink,
          ),
        );

  static const String name = 'ForgotPasswordView';
}

class ForgotPasswordViewArgs {
  const ForgotPasswordViewArgs({
    this.key,
    this.fromLink = false,
  });

  final _i13.Key? key;

  final bool fromLink;

  @override
  String toString() {
    return 'ForgotPasswordViewArgs{key: $key, fromLink: $fromLink}';
  }
}

/// generated route for
/// [_i9.ScanView]
class ScanViewRoute extends _i12.PageRouteInfo<void> {
  const ScanViewRoute()
      : super(
          ScanViewRoute.name,
          path: '/scan-view',
        );

  static const String name = 'ScanView';
}

/// generated route for
/// [_i10.DashboardView]
class DashboardViewRoute extends _i12.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardView';
}

extension RouterStateExtension on _i11.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAuthView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToContactsView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ContactsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSettingsView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardEditorView({
    _i13.Key? key,
    _i14.DigitalCardDTO? card,
    _i15.ActionType? actionType,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardEditorViewRoute(
        key: key,
        card: card,
        actionType: actionType,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardViewerView({
    String? uuid,
    _i13.Key? key,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardViewerViewRoute(
        uuid: uuid,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToForgotPasswordView({
    _i13.Key? key,
    bool fromLink = false,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ForgotPasswordViewRoute(
        key: key,
        fromLink: fromLink,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToScanView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ScanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAuthView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithContactsView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ContactsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSettingsView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardEditorView({
    _i13.Key? key,
    _i14.DigitalCardDTO? card,
    _i15.ActionType? actionType,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardEditorViewRoute(
        key: key,
        card: card,
        actionType: actionType,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardViewerView({
    String? uuid,
    _i13.Key? key,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardViewerViewRoute(
        uuid: uuid,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithForgotPasswordView({
    _i13.Key? key,
    bool fromLink = false,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ForgotPasswordViewRoute(
        key: key,
        fromLink: fromLink,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithScanView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ScanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }
}
