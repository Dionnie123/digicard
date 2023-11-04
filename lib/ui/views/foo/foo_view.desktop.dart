import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'foo_viewmodel.dart';

class FooViewDesktop extends ViewModelWidget<FooViewModel> {
  const FooViewDesktop({super.key});

  @override
  Widget build(BuildContext context, FooViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
