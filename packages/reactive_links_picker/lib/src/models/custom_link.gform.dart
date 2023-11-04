// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'custom_link.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCustomLinkFormConsumer extends StatelessWidget {
  const ReactiveCustomLinkFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, CustomLinkForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

    if (formModel is! CustomLinkForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CustomLinkFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CustomLinkFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final CustomLinkForm form;
}

class ReactiveCustomLinkForm extends StatelessWidget {
  const ReactiveCustomLinkForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final CustomLinkForm form;

  final WillPopCallback? onWillPop;

  static CustomLinkForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<CustomLinkFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        CustomLinkFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as CustomLinkFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CustomLinkFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class CustomLinkFormBuilder extends StatefulWidget {
  const CustomLinkFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final CustomLink? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, CustomLinkForm formModel, Widget? child) builder;

  final void Function(BuildContext context, CustomLinkForm formModel)?
      initState;

  @override
  _CustomLinkFormBuilderState createState() => _CustomLinkFormBuilderState();
}

class _CustomLinkFormBuilderState extends State<CustomLinkFormBuilder> {
  late CustomLinkForm _formModel;

  @override
  void initState() {
    _formModel =
        CustomLinkForm(CustomLinkForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomLinkFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          CustomLinkForm(CustomLinkForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveCustomLinkForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class CustomLinkForm implements FormModel<CustomLink> {
  CustomLinkForm(
    this.form,
    this.path,
  );

  static const String valueControlName = "value";

  static const String labelControlName = "label";

  static const String customControlName = "custom";

  static const String iconControlName = "icon";

  final FormGroup form;

  final String? path;

  String valueControlPath() => pathBuilder(valueControlName);

  String labelControlPath() => pathBuilder(labelControlName);

  String customControlPath() => pathBuilder(customControlName);

  String iconControlPath() => pathBuilder(iconControlName);

  String get _valueValue => valueControl.value as String;

  String get _labelValue => labelControl.value as String;

  String get _customValue => customControl.value as String;

  Widget? get _iconValue => iconControl?.value;

  bool get containsValue {
    try {
      form.control(valueControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLabel {
    try {
      form.control(labelControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCustom {
    try {
      form.control(customControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIcon {
    try {
      form.control(iconControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get valueErrors => valueControl.errors;

  Object? get labelErrors => labelControl.errors;

  Object? get customErrors => customControl.errors;

  Object? get iconErrors => iconControl?.errors;

  void get valueFocus => form.focus(valueControlPath());

  void get labelFocus => form.focus(labelControlPath());

  void get customFocus => form.focus(customControlPath());

  void get iconFocus => form.focus(iconControlPath());

  void iconRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsIcon) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          iconControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            iconControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void valueValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    valueControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void iconValueUpdate(
    Widget? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    iconControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void valueValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    valueControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void iconValuePatch(
    Widget? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    iconControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void valueValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      valueControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void labelValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      labelControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void customValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      customControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void iconValueReset(
    Widget? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      iconControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String> get valueControl =>
      form.control(valueControlPath()) as FormControl<String>;

  FormControl<String> get labelControl =>
      form.control(labelControlPath()) as FormControl<String>;

  FormControl<String> get customControl =>
      form.control(customControlPath()) as FormControl<String>;

  FormControl<Widget>? get iconControl => containsIcon
      ? form.control(iconControlPath()) as FormControl<Widget>?
      : null;

  void valueSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      valueControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      valueControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void labelSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      labelControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      labelControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void customSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      customControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      customControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void iconSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      iconControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      iconControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  CustomLink get model {
    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'CustomLinkForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return CustomLink(
        value: _valueValue,
        label: _labelValue,
        custom: _customValue,
        icon: _iconValue);
  }

  @override
  void submit({
    required void Function(CustomLink model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    CustomLink value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(CustomLinkForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    CustomLink? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(CustomLink? customLink) => FormGroup({
        valueControlName: FormControl<String>(
            value: customLink?.value,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        labelControlName: FormControl<String>(
            value: customLink?.label,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        customControlName: FormControl<String>(
            value: customLink?.custom,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        iconControlName: FormControl<Widget>(
            value: customLink?.icon,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveCustomLinkFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveCustomLinkFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(CustomLinkForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      CustomLinkForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, CustomLinkForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveCustomLinkFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveCustomLinkFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      CustomLinkForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      CustomLinkForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, CustomLinkForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
