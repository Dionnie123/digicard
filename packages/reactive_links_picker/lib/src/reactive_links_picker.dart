import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'fields_list/fields_list.dart';
import 'icons_list/icons_list.dart';
import 'link_types.dart';

class LinksPicker extends StatefulWidget {
  final List<Map<String, dynamic>?> value;
  final Function(List<Map<String, dynamic>?>?) onValueChanged;

  const LinksPicker(
      {super.key, required this.onValueChanged, this.value = const []});

  @override
  State<LinksPicker> createState() => _LinksPickerState();
}

class _LinksPickerState extends State<LinksPicker> {
  late FormGroup form;

  FormArray<Map<String, dynamic>> get customLinks =>
      form.control('customLinks') as FormArray<Map<String, dynamic>>;

  @override
  void initState() {
    form = FormGroup({
      'customLinks': FormArray<Map<String, dynamic>>([]),
    });

    for (var i = 0; i < widget.value.length; i++) {
      final customLink = widget.value[i];
      customLinks.add(
          FormGroup({
            'value': FormControl<String>(
                value: customLink?['value'],
                validators: [const RequiredValidator()]),
            'custom': FormControl<String>(value: customLink?['custom']),
            'label': FormControl<String>(value: customLink?['label']),
            'id': FormControl<String>(
                value: "customLink-${UniqueKey()}".toString()),
          }),
          updateParent: true,
          emitEvent: true);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 150),
            child: FieldsList(
              onUpdate: (index, link) {
                customLinks.insert(
                    index,
                    FormGroup({
                      'value': FormControl<String>(
                          value: link.value,
                          validators: [const RequiredValidator()]),
                      'custom': FormControl<String>(value: link.custom),
                      'label': FormControl<String>(value: link.label),
                      'id': FormControl<String>(
                          value: "customLink-${UniqueKey()}".toString()),
                    }),
                    updateParent: true);
                customLinks.removeAt(index, updateParent: true);
                widget.onValueChanged(customLinks.value);
              },
              onReorder: (oldIndex, newIndex) async {
                final a = customLinks.controls[oldIndex];
                final b = customLinks.controls[newIndex];

                customLinks.insert(
                  newIndex,
                  a,
                );
                customLinks.insert(oldIndex, b);

                customLinks.removeAt(
                  oldIndex,
                );
                customLinks.removeAt(
                  newIndex,
                );
                widget.onValueChanged(customLinks.value);
              },
              onRemovedAt: (index) {
                setState(() {
                  customLinks.removeAt(
                    index,
                    updateParent: true,
                  );
                  print(form.value);
                  widget.onValueChanged(customLinks.value);
                });
              },
            ),
          ),
          Container(
            constraints: const BoxConstraints(minHeight: 150),
            child: IconsList(
              customLinks: linkTypes,
              onLinkCreated: (customLink) {
                setState(() {
                  customLinks.add(
                      FormGroup({
                        'value': FormControl<String>(
                            value: customLink.value,
                            validators: [const RequiredValidator()]),
                        'custom': FormControl<String>(value: customLink.custom),
                        'label': FormControl<String>(value: customLink.label),
                        'id': FormControl<String>(
                            value: "customLink-${UniqueKey()}".toString()),
                      }),
                      updateParent: true,
                      emitEvent: true);
                  print(form.value);
                  widget.onValueChanged(customLinks.value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReactiveLinksPicker extends ReactiveFormField<List<Map<String, dynamic>>,
    List<Map<String, dynamic>>> {
  ReactiveLinksPicker({
    Key? key,
    String? formControlName,
    FormControl<List<Map<String, dynamic>>>? formControl,
    List<List<Map<String, dynamic>>> colors = const [],
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return LinksPicker(
              value: field.value ?? [],
              onValueChanged: (customLinks) {
                final List<Map<String, dynamic>>? x =
                    customLinks?.cast<Map<String, dynamic>>();

                field.control.value = x ?? [];
                field.control.markAsDirty();
                field.didChange(x);
                field.control.updateValueAndValidity();
              },
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveLinksPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<List<Map<String, dynamic>>, List<Map<String, dynamic>>>
      createState() => ReactiveFormFieldState<List<Map<String, dynamic>>,
          List<Map<String, dynamic>>>();
}
