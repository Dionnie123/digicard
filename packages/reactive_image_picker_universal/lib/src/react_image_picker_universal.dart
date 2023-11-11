import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'image_source_picker.dart';

class ReactiveImagePickerUniversal
    extends ReactiveFormField<Uint8List, Uint8List> {
  ReactiveImagePickerUniversal({
    Key? key,
    bool? readOnly,
    String? formControlName,
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
          'ReactiveImagePickerUniversal requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<Uint8List, Uint8List> createState() =>
      ReactiveFormFieldState<Uint8List, Uint8List>();
}
