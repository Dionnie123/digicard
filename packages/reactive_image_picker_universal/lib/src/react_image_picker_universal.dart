import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'image_source_picker.dart';

class ReactiveImagePickerUniversal<T> extends ReactiveFormField<T, Uint8List> {
  ReactiveImagePickerUniversal({
    Key? key,
    bool? readOnly,
    String? formControlName,
    String? imageUrl,
    FormControl<T>? formControl,
    ReactiveFormFieldCallback<T>? onChanged,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return ImageSourcePicker(
              onImageFetched: (value) {},
              imageUrl: imageUrl,
              onChanged: (value) {
                field.control.markAsDirty();
                field.control.updateValueAndValidity();
                field.didChange(value);
                onChanged?.call(field.control);
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
  ReactiveFormFieldState<T, Uint8List> createState() =>
      ReactiveFormFieldState<T, Uint8List>();
}
