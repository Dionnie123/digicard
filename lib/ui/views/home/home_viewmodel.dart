import 'dart:async';
import 'package:digicard/app/app.bottomsheets.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<RouterService>();
  final _digitalCardService = locator<DigitalCardService>();
  final _contactsService = locator<ContactsService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _digitalCardService,
      ];

  List<DigitalCardDTO> get digitalCards => _digitalCardService.digitalCards;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString(),
      );
    });
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    return await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }

  view(DigitalCardDTO card) {
    _navigationService.navigateToCardEditorView(
      card: card,
      actionType: ActionType.view,
    );
  }

  show(DigitalCardDTO? card) async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.cardManager,
      data: card,
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }

  create() {
    _navigationService.navigateToCardEditorView(
      card: DigitalCardDTO.blank(),
      actionType: ActionType.create,
    );
  }

  late FormGroup form;

  Future init() async {
    form = FormGroup(
      {
        'name': FormControl<String>(),
        'customLinks': FormControl<List<Map<String, dynamic>>>(
            value: <Map<String, dynamic>>[],
            validators: [const NotEmptyValidator()]),
      },
    );
    await runBusyFuture(
      Future.wait([
        _digitalCardService.getAll(),
        Future.delayed(const Duration(seconds: 1))
        // _contactsService.getAll(),
      ]),
      throwException: true,
    );
  }
}
