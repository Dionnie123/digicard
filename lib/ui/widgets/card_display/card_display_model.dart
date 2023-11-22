import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/native_contacts_service.dart';
import 'package:stacked/stacked.dart';

class CardDisplayModel extends BaseViewModel {
  final _nativeContactsService = locator<NativeContactsService>();
  final log = getLogger('CardDisplayModel');
  Future downloadVcf(DigitalCardDTO card) async {
    try {
      await _nativeContactsService.download(card);
    } catch (e) {
      log.e(e.toString());
    }
  }
}
