import 'dart:math';

import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:flutter_ez_core/widgets/ez_button.dart';
import 'package:flutter_ez_core/widgets/scaffold_body_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'custom_link_viewmodel.dart';

class CustomLinkView extends StackedView<CustomLinkViewModel> {
  final CustomLink customLink;
  final int? index;
  const CustomLinkView(this.customLink, {this.index, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomLinkViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: LayoutBuilder(builder: (context, size) {
        return ScaffoldBodyWrapper(
            isFullWidth: true,
            padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: max((size.maxWidth - 440.000) / 2, 0) > 0
                    ? max((size.maxWidth - 440.000) / 2, 0)
                    : 15),
            neverScroll: true,
            centered: true,
            builder: (context, size) {
              return CustomLinkFormBuilder(
                  model: customLink,
                  builder: (context, formModel, _) {
                    TextInputType? keyboardType(val) {
                      switch (val) {
                        case "Email":
                          return TextInputType.emailAddress;
                        case "Phone Number":
                          return TextInputType.phone;
                        case "Website":
                          return TextInputType.url;

                        default:
                          return null;
                      }
                    }

                    TextInputAction? textInputAction(val) {
                      switch (val) {
                        case "Address":
                          return TextInputAction.next;

                        default:
                          return TextInputAction.next;
                      }
                    }

                    showErrors(control) => false;
                    const inputStyle = InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Icon(
                            Icons.link_rounded,
                            size: 20,
                          ),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        alignLabelWithHint: true,
                        counterText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.auto);

                    Widget textField() {
                      return ReactiveTextField(
                          validationMessages: {
                            'required': (error) => 'Required'
                          },
                          showErrors: showErrors,
                          formControl: formModel.valueControl,
                          decoration: inputStyle);
                    }

                    return Column(
                      children: [
                        textField(),
                        vSpaceRegular,
                        EzButton(
                          disabled: formModel.valueControl.hasErrors,
                          title: "SAVE",
                          onPressed: () {
                            locator<RouterService>().back(result: {
                              'index': index,
                              'customLink': formModel.model
                            });
                          },
                        )
                      ],
                    );
                  });
            });
      }),
    );
  }

  @override
  CustomLinkViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomLinkViewModel();
}
