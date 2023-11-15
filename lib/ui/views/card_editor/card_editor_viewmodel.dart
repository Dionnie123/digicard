import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';

class CardEditorViewModel extends ReactiveViewModel {
  final log = getLogger('CardEditorViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  final _dialogService = locator<DialogService>();

  final _digitalCardsService = locator<DigitalCardService>();
  final _navigationService = locator<RouterService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  bool editMode = false;
  late ActionType actionType;
  late DigitalCard model;

  Future<void> initialize(DigitalCard m, ActionType action) async {
    model = m;
    actionType = action;
    editMode = [
      ActionType.create,
      ActionType.edit,
      ActionType.duplicate,
    ].contains(actionType);
  }

  Future<bool> showExitDialog(bool isFormPristine) async {
    if (isFormPristine && actionType == ActionType.duplicate) {
      DialogResponse? res = await _dialogService.showCustomDialog(
        variant: DialogType.confirm,
        title: "Discard",
        description: "Are you sure you want to dispose this card?",
        mainButtonTitle: "Yes",
        secondaryButtonTitle: "Cancel",
        barrierDismissible: true,
      );
      return res?.confirmed ?? false;
    }

    if (isFormPristine == false) {
      DialogResponse? res = await _dialogService.showCustomDialog(
        variant: DialogType.confirm,
        title: "Unsaved Changes",
        description: "Are you sure you want to leave without saving?",
        mainButtonTitle: "Yes",
        secondaryButtonTitle: "Cancel",
        barrierDismissible: true,
      );
      return res?.confirmed ?? false;
    }
    return Future.value(true);
  }

  Future<void> showFormErrorsDialog() async {
    await _dialogService.showCustomDialog(
        variant: DialogType.info,
        description: "First name is required",
        barrierDismissible: true);
  }

  Future<void> save(DigitalCard formValue) async {
    if (actionType == ActionType.create) {
      await runBusyFuture(_digitalCardsService.create(formValue),
          throwException: true, busyObject: saveBusyKey);
    } else if (actionType == ActionType.edit) {
      await runBusyFuture(_digitalCardsService.update(formValue),
          throwException: true, busyObject: saveBusyKey);
    } else if (actionType == ActionType.duplicate) {
      await runBusyFuture(_digitalCardsService.duplicate(formValue),
          throwException: true, busyObject: saveBusyKey);
    }
    setBusyForObject(saveBusyKey, false);
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
  }

  Future exitEditor() async {
    await _navigationService.pop(true);
  }
}
