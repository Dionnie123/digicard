import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'image_source_picker.dart';

class ReactiveAvatarPickerUniversal
    extends ReactiveFormField<Uint8List, Uint8List> {
  ReactiveAvatarPickerUniversal({
    Key? key,
    bool? readOnly,
    Function()? onTap,
    String? formControlName,
    Color? backgroundColor,
    FormControl<Uint8List>? formControl,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return ImageSourcePicker(
              onChanged: (value) {
                field.control.value = value;
                field.control.markAsDirty();
                field.didChange(value);
                field.control.updateValueAndValidity();
              },
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveAvatarPickerUniversal requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<Uint8List, Uint8List> createState() =>
      ReactiveFormFieldState<Uint8List, Uint8List>();
}
