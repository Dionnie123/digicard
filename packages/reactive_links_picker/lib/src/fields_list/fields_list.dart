import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../helpers/list_extenstion.dart';
import '../helpers/sliver_grid_delegate.dart';
import '../models/custom_link.dart';
import 'dialog.dart';

class FieldsList extends StatefulWidget {
  final Function(int index, CustomLink link) onUpdate;
  final Function(int oldIndex, int newIndex) onReorder;
  final Function(int index) onRemovedAt;

  const FieldsList({
    super.key,
    required this.onReorder,
    required this.onRemovedAt,
    required this.onUpdate,
  });

  @override
  State<FieldsList> createState() => _LinksListState();
}

class _LinksListState extends State<FieldsList> {
  final _scrollController = ScrollController();
  final gridViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context, listen: false) as FormGroup;
    double itemHeight = kIsWeb ? 144 : 144;

    removeFocus() {
      final FocusScopeNode currentScope = FocusScope.of(context);
      if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }

    return ReactiveFormArray(
        formArray:
            form.control('customLinks') as FormArray<Map<String, dynamic>>,
        builder: (context, array, child) {
          return DottedBorder(
            dashPattern: const [9, 3],
            borderPadding: const EdgeInsets.all(8.0),
            strokeCap: StrokeCap.butt,
            radius: const Radius.circular(12.0),
            color: Colors.white,
            strokeWidth: 1,
            child: array.controls.isEmpty
                ? SizedBox(
                    height: itemHeight,
                    child: const Center(
                      child: Text("Tap a field to add in your card."),
                    ),
                  )
                : Column(
                    children: [
                      ReorderableBuilder(
                        scrollController: _scrollController,
                        longPressDelay: const Duration(milliseconds: 300),
                        onDragEnd: () {},
                        onDragStarted: () {
                          removeFocus();
                        },
                        onReorder:
                            (List<OrderUpdateEntity> orderUpdateEntities) {
                          for (final orderUpdateEntity in orderUpdateEntities) {
                            try {
                              array.value?.swap(
                                orderUpdateEntity.oldIndex,
                                orderUpdateEntity.newIndex,
                              );
                              final oldControl =
                                  array.controls[orderUpdateEntity.oldIndex];
                              array.removeAt(orderUpdateEntity.oldIndex);
                              array.insert(
                                  orderUpdateEntity.newIndex, oldControl);
                              widget.onReorder(
                                orderUpdateEntity.oldIndex,
                                orderUpdateEntity.newIndex,
                              );
                            } catch (e) {}
                          }

                          /*   */
                        },
                        builder: (children) {
                          return GridView(
                            padding: const EdgeInsets.all(12),
                            shrinkWrap: true,
                            key: gridViewKey,
                            controller: _scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    height: itemHeight),
                            children: children,
                          );
                        },
                        children: [
                          for (int i = 0; i < array.controls.length; i++)
                            LayoutBuilder(
                                key: Key(
                                    "${form.control('customLinks.$i.id').value}"),
                                builder: (context, size) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        removeFocus();
                                      },
                                      child: SizedBox(
                                        height: itemHeight,
                                        width: size.maxWidth,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: form
                                                          .control(
                                                              "customLinks.$i")
                                                          .valid
                                                      ? Colors.transparent
                                                      : Colors.red,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Wrap(
                                                      children: [
                                                        GestureDetector(
                                                            child: const Icon(Icons
                                                                .sort_rounded)),
                                                        const SizedBox(
                                                          width: 8.0,
                                                        ),
                                                        Text(
                                                            "${form.control('customLinks.$i.label').value}")
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                        onTap: () async {
                                                          await showDeleteDialog(
                                                                  context)
                                                              .then((value) {
                                                            if (value == true) {
                                                              widget
                                                                  .onRemovedAt(
                                                                      i);
                                                            }
                                                          });
                                                        },
                                                        child: const Icon(Icons
                                                            .clear_rounded))
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                ReactiveTextField(
                                                  onChanged: (control) {
                                                    widget.onUpdate(
                                                        i,
                                                        CustomLink.fromJson(
                                                            control.parent
                                                                    ?.value
                                                                as Map<String,
                                                                    dynamic>));
                                                  },

                                                  showErrors: (control) {
                                                    return false;
                                                  },
                                                  formControl: form.control(
                                                          'customLinks.$i.value')
                                                      as FormControl,
                                                  //  formControlName: '$i.value',
                                                  decoration:
                                                      const InputDecoration(
                                                    isDense: true,
                                                    filled: false,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 12,
                                                            horizontal: 12),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                ReactiveTextField(
                                                  onChanged: (control) {
                                                    widget.onUpdate(
                                                        i,
                                                        CustomLink.fromJson(
                                                            control.parent
                                                                    ?.value
                                                                as Map<String,
                                                                    dynamic>));
                                                  },

                                                  showErrors: (control) {
                                                    return false;
                                                  },
                                                  formControl: form.control(
                                                          'customLinks.$i.custom')
                                                      as FormControl,
                                                  //  formControlName: '$i.custom',
                                                  decoration:
                                                      const InputDecoration(
                                                    isDense: true,
                                                    filled: false,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 12,
                                                            horizontal: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ],
                  ),
          );
        });
  }
}
