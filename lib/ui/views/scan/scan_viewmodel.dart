import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/helpers/card_url_checker.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/ui/views/card_viewer/card_view.dart';
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

  final _navigationService = locator<RouterService>();
  final _dialogService = locator<DialogService>();
  final _digitalCardService = locator<DigitalCardService>();
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

  PermissionStatus? status;
  Barcode? result;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future openScanner() async {
    if (!kIsWeb) {
      status = await Permission.camera.status;

      if (status?.isGranted == false) {
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
        await _navigationService.navigateWithTransition(const ScanQRCodeView());
      }
    } else {
      await _navigationService.navigateWithTransition(const ScanQRCodeView());
    }
  }

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      try {
        controller.pauseCamera();
        result = scanData;
        if (CardUrl("${result?.code}").isValid()) {
          if (CardUrl("${result?.code}").uuid != null) {
            DigitalCardDTO? card;
            await _digitalCardService
                .findOne(CardUrl("${result?.code}").uuid.toString())
                .then((value) => card = value);
            if (card != null) {
              await _navigationService
                  .navigateWithTransition(
                      CardView(card: card ?? DigitalCardDTO.blank()))
                  .then((value) {
                controller.resumeCamera();
              });
            } else {
              await _dialogService.showCustomDialog(
                variant: DialogType.info,
                title: "Card not found",
                description: "Card might be deleted by the owner.",
                barrierDismissible: true,
              );
            }
          }
        } else {}
      } catch (e) {
        rethrow;
      } finally {
        controller.resumeCamera();
      }

      notifyListeners();
    });
  }
}
