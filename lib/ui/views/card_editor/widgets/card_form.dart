import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/extensions/core/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/common/ui_helpers.dart';
import 'package:digicard/ui/views/card_editor/card_editor_viewmodel.dart';
import 'package:digicard/ui/widgets/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';

import 'form_components/card.custom_links.fields.dart';
import 'form_components/card.custom_links.options.dart';
import 'form_components/card.reactive_avatar_picker.dart';
import 'form_components/card.reactive_color_picker.dart';
import 'form_components/card.reactive_layout_picker.dart';
import 'form_components/card.reactive_logo_picker.dart';
import 'form_components/collapsible_field.dart';

class CardTabForm extends StatefulWidget {
  const CardTabForm({Key? key}) : super(key: key);

  @override
  State<CardTabForm> createState() => _CardTabFormState();
}

class _CardTabFormState extends State<CardTabForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Tab(
      text: 'Info',
    ),
    const Tab(text: 'Designs'),
    const Tab(text: 'Links'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel = getParentViewModel<CardEditorViewModel>(
      context,
      listen: true,
    );
    final formModel = viewModel.formModel;
    final colorTheme = Color(formModel.colorControl.value ?? kcPrimaryColorInt);

    const inputStyle = InputDecoration(
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        floatingLabelBehavior: FloatingLabelBehavior.never);

    Widget avatarField() {
      return ReactiveAvatarPicker(
        formControl: formModel.avatarFileControl,
        readOnly: !viewModel.editMode,
        backgroundColor: colorTheme,
        onTap: !viewModel.editMode
            ? null
            : () async {
                formModel.form.unfocus();
                await viewModel.showAvatarPicker(context);
              },
      );
    }

    Widget logoField() {
      return ReactiveLogoPicker(
        formControl: formModel.logoFileControl,
        readOnly: !viewModel.editMode,
        backgroundColor: colorTheme,
        onTap: !viewModel.editMode
            ? null
            : () async {
                formModel.form.unfocus();
                await viewModel.showLogoPicker(context);
              },
      );
    }

    Widget colorPickerField() {
      return ReactiveColorPicker(
        colors: const [
          0xFFFF0000, // red
          0xFFFF4500, // Orange Red
          0xFFFFA500, // orange
          0xFF994C15,
          0xFFFFC107, // amber
          0xFFCDDC39, // lime
          0xFF4CAF50, // green
          0xFF8BC34A, // lightGreen
          0xFF2196F3, // blue
          0xFF3F51B5, // indigo
          0xFFFFC0CB, // pink
          0xFF808080, // Gray
        ],
        formControl: formModel.colorControl,
      );
    }

    Widget layoutPickerField() {
      return ReactiveLayoutPicker(
        color: colorTheme,
        formControl: formModel.layoutControl,
      );
    }

    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          onSubmitted: (control) {},
          showErrors: (control) => false,
          formControl: formModel.titleControl,
          textInputAction: TextInputAction.done,
          decoration: inputStyle.copyWith(label: const Text("Title")),
        ),
      );
    }

    Widget prefixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.prefixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Prefix")),
        ),
      );
    }

    Widget firstNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.firstNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("First name*")),
        ),
      );
    }

    Widget middleNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.middleNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Middle name")),
        ),
      );
    }

    Widget lastNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.lastNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Last name")),
        ),
      );
    }

    Widget suffixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.suffixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Suffix")),
        ),
      );
    }

    Widget accrediationsField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.accreditationsControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Accreditations")),
        ),
      );
    }

    Widget maidenNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.maidenNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Maiden Name")),
        ),
      );
    }

    Widget positionField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.positionControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Position")),
        ),
      );
    }

    Widget departmentField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: formModel.departmentControl,
        textInputAction: TextInputAction.next,
        decoration: inputStyle.copyWith(label: const Text("Department")),
      );
    }

    Widget companyField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.companyControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Company")),
        ),
      );
    }

    Widget headlineField() {
      return ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.headlineControl,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 1,
          decoration: inputStyle.copyWith(label: const Text("Headline")));
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(viewModel.actionType == ActionType.edit
            ? "Edit Card"
            : viewModel.actionType == ActionType.duplicate
                ? "Copy Card "
                : "Create Card"),
        actions: [
          ReactiveDigitalCardFormConsumer(builder: (context, f, w) {
            return ((viewModel.editMode) &&
                    viewModel.formModel.form.pristine != true)
                ? TextButton(
                    onPressed: () async {
                      await viewModel.save();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ))
                : const SizedBox.shrink();
          }),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: Colors.white,
          indicatorColor: colorTheme,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: colorTheme),
        ),
      ),
      body: LayoutBuilder(builder: (context, size) {
        return TabBarView(
          controller: _tabController,
          children: [
            ScaffoldBodyWrapper(
                isFullWidth: true,
                padding: scaffoldBodyPadding(
                  size: size,
                  hPadding: 15,
                  vPadding: 15,
                ),
                builder: (context, size) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              titleField(),
                              vSpaceSmall,
                              CollapsibleField(
                                  onToggle: (expanded) {
                                    viewModel.formModel.form.unfocus();
                                  },
                                  value:
                                      "${formModel.prefixControl.value ?? ""} ${formModel.firstNameControl.value ?? ""} ${formModel.middleNameControl.value ?? ""} ${formModel.lastNameControl.value ?? ""} ${formModel.suffixControl.value ?? ""}"
                                          .clean(),
                                  body: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      children: [
                                        prefixField(),
                                        vSpaceSmall,
                                        firstNameField(),
                                        vSpaceSmall,
                                        middleNameField(),
                                        vSpaceSmall,
                                        lastNameField(),
                                        vSpaceSmall,
                                        suffixField(),
                                        vSpaceSmall,
                                        accrediationsField(),
                                        vSpaceSmall,
                                        maidenNameField(),
                                      ],
                                    ),
                                  )),
                              vSpaceSmall,
                              positionField(),
                              vSpaceSmall,
                              departmentField(),
                              vSpaceSmall,
                              companyField(),
                              vSpaceSmall,
                              headlineField(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            ScaffoldBodyWrapper(
              isFullWidth: true,
              padding: scaffoldBodyPadding(
                size: size,
                hPadding: 15,
                vPadding: 15,
              ),
              builder: (context, size) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Design Layout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    layoutPickerField(),
                    vSpaceRegular,
                    const Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    colorPickerField(),
                    vSpaceRegular,
                    const Text(
                      "Profile Image",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    avatarField(),
                    vSpaceRegular,
                    const Text(
                      "Logo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    logoField(),
                  ],
                );
              },
            ),
            ScaffoldBodyWrapper(
              isFullWidth: true,
              padding: scaffoldBodyPadding(
                size: size,
                hPadding: 15,
                vPadding: 15,
              ),
              builder: (context, size) {
                return const Column(
                  children: [
                    CustomLinkFields(),
                    CustomLinkOptions(),
                  ],
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
