import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/helpers/card_url_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_links/uni_links.dart';

class DeeplinkService with ListenableServiceMixin {
  final _navService = locator<RouterService>();
  final log = getLogger('DeeplinkService');

  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    final Uri? uri = await getInitialUri();

    if (uri != null) {
      if (CardUrl(uri.toString()).isValid()) {
        _navService.navigateToCardViewerView(
            displayType: DisplayType.private,
            uuid: CardUrl(uri.toString()).uuid);
      }
      log.d("Initial Deeplink: ${uri.toString()}");
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) async {
        if (uri != null) {
          if (CardUrl(uri.toString()).isValid()) {
            if (_navService.topRoute.name == CardViewerViewRoute.name) {
              _navService.replaceWithCardViewerView(
                  displayType: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid);
            } else {
              _navService.navigateToCardViewerView(
                  displayType: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid);
            }
          }
          log.i("Stream Deeplink: ${uri.toString()}");
        }
      }, onError: (Object err) {});
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
