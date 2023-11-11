import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/helpers/card_url_checker.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'scan_qr_code_view.dart';

class ScanViewModel extends ReactiveViewModel {
  final log = getLogger('ScanViewModel');

  final _navService = locator<RouterService>();
  final _dialogService = locator<DialogService>();

  @override
  Future<void> onFutureError(error, Object? key) async {
    log.e(error);

    await _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    controller?.resumeCamera();

    super.onFutureError(error, key);
  }

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future openScanner() async {
    if (!kIsWeb) {
      var status = await Permission.camera.status;

      if (status.isGranted == false) {
        await _dialogService
            .showCustomDialog(
                variant: DialogType.confirm,
                title: 'Permisson Denied',
                description:
                    'To scan QR Code, authorize Digicard to access camera from App Settings.',
                mainButtonTitle: 'Open Settings')
            .then((value) {
          if (value?.confirmed ?? false) {
            openAppSettings();
          }
        });
      } else {
        await _navService.navigateWithTransition(const ScanQRCodeView());
      }
    } else {
      await _navService.navigateWithTransition(const ScanQRCodeView());
    }
  }

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      try {
        result = scanData;
        log.d(result?.code);
        if (CardUrl("${result?.code}").isValid()) {
          /*   _navService
              .push(CardLoaderRoute(uuid: CardUrl("${result?.code}").uuid))
              .then((value) {
            controller.resumeCamera();
          }); */
          _navService
              .navigateToCardViewerView(
                  card: DigitalCard.blank(),
                  displayType: DisplayType.private,
                  uuid: CardUrl("${result?.code}").uuid)
              .then((value) {
            controller.resumeCamera();
          });
        } else {
          //controller.resumeCamera();
        }
      } catch (e) {
        rethrow;
      }

      notifyListeners();
    });
  }
}