import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CardViewerViewModel extends ReactiveViewModel {
  final log = getLogger('CardViewerViewModel');
  final _digitalCardService = locator<DigitalCardService>();
  final _dialogService = locator<DialogService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  DigitalCardDTO? card;

  Future loadCardbyUuid(String uuid) async {
    await runBusyFuture(
      _digitalCardService.findOne(uuid).then((value) => card = value),
      throwException: true,
    );
  }
}
