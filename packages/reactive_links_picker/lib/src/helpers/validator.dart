import 'package:reactive_forms/reactive_forms.dart';

/// Validator that validates the control's value must be `true`.
class NotEmptyValidator extends Validator<List<Map<String, dynamic>>> {
  const NotEmptyValidator() : super();

  @override
  Map<String, dynamic>? validate(
      AbstractControl<List<Map<String, dynamic>>> control) {
    bool hasEmptyLabel = false;

    control.value?.forEach((e) {
      if (e['value'] == '' || e['value'] == null) {
        hasEmptyLabel = true;
        return;
      }
    });

    return (control.value as List<Map<String, dynamic>>).isEmpty ||
            control.value == null ||
            hasEmptyLabel
        ? {'emptyList': true}
        : null;
  }
}
