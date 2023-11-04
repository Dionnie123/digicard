import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:reactive_links_picker/reactive_links_picker.dart';

class Foo extends StatefulWidget {
  const Foo({super.key});

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  late FormGroup form;

  @override
  void initState() {
    form = FormGroup(
      {
        'customLinks': FormControl<List<Map<String, dynamic>>>(
            value: <Map<String, dynamic>>[],
            validators: [const NotEmptyValidator()]),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? ReactiveForm(
            formGroup: form,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Reactive Links Picker"),
                actions: [
                  IconButton(
                      onPressed: () {
                        print("----------------");
                        print(form.value);
                        print("----------------");
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
              body: Column(
                children: [
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return Text(form.valid.toString());
                  }),
                  Expanded(
                    child: ReactiveLinksPicker(
                      formControlName: 'customLinks',
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Text("FSDFSF");
  }
}
