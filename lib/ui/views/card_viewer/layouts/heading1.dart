import 'package:digicard/ui/views/card_viewer/card_viewer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:typed_data';
import 'dart:ui';

class Heading1 extends StatelessWidget {
  const Heading1({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardViewerViewModel>(context, listen: true);

    Widget logoField() {
      return viewModel.card.logoFile != null
          ? AnimatedOpacity(
              opacity: viewModel.card.logoFile != null ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: MemoryImage(
                        viewModel.card.logoFile ?? Uint8List(0),
                      ),
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink();
    }

    Widget avatar() {
      return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: viewModel.card.avatarFile == null
            ? Container(
                height: 120,
                color: viewModel.color,
              )
            : Container(
                decoration: BoxDecoration(
                  color: viewModel.color,
                  image: DecorationImage(
                    image: MemoryImage(
                      viewModel.card.avatarFile ?? Uint8List(0),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: viewModel.color,
                        image: DecorationImage(
                            image: MemoryImage(
                              viewModel.card.avatarFile ?? Uint8List(0),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
      );
    }

    return LayoutBuilder(builder: (context, size) {
      return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: SizedBox(
            width: size.maxWidth,
            height: viewModel.card.avatarFile == null ? 120 : size.maxWidth,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                avatar(),
                Positioned(
                  bottom: 0,
                  width: size.maxWidth,
                  child: const Text("RRR"),
                  /*   child: CardWaveDivider(
                    context,
                    color: viewModel.color,
                    size: size,
                    child: logoField(),
                  ), */
                )
              ],
            )),
      );
    });
  }
}
