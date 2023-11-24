import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/helpers/card_url_checker.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_links/uni_links.dart';

class DeeplinkService with ListenableServiceMixin {
  final _navigationService = locator<RouterService>();
  final log = getLogger('DeeplinkService');
  final _userService = locator<UserService>();
  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    final Uri? uri = await getInitialUri();

    if (uri != null) {
      log.i("Incoming Deep Link $uri");
      if (CardUrl(uri.toString()).isValid()) {
        await _navigationService.navigateToCardViewerWebView(
            uuid: CardUrl(uri.toString()).uuid);
      } else {}
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) async {
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

  void dispose() {
    _streamSubscription?.cancel();
  }
}
