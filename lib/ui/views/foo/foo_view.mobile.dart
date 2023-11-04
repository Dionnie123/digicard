import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'foo_viewmodel.dart';

class FooViewMobile extends ViewModelWidget<FooViewModel> {
  const FooViewMobile({super.key});

  @override
  Widget build(BuildContext context, FooViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
