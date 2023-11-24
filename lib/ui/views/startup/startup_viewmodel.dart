import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/helpers/card_url_checker.dart';
import 'package:digicard/app/services/deeplink_service.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_links/uni_links.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<RouterService>();
  final _userService = locator<UserService>();

  StreamSubscription? streamSubscription;
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final Uri? uri = await getInitialUri();
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    FlutterNativeSplash.remove();

    log.i("Incoming Deep Link $uri");

    if (_userService.userId != null) {
      await _navigationService.clearStackAndShow(
        const HomeViewRoute(),
      );
    } else {
      await _navigationService.clearStackAndShow(
        const AuthViewRoute(),
      );
    }

    if (CardUrl(uri.toString()).isValid()) {
      await _navigationService.navigateToCardViewerWebView(
          uuid: CardUrl(uri.toString()).uuid);
    }

    if (!kIsWeb) {
      streamSubscription = uriLinkStream.listen((Uri? uri) async {
        if (uri != null) {
          log.i("Stream Deep Link $uri");
          if (CardUrl(uri.toString()).isValid()) {
            await _navigationService.navigateToCardViewerWebView(
                uuid: CardUrl(uri.toString()).uuid);
          }
        }
      }, onError: (Object err) {});
    }
  }
}
