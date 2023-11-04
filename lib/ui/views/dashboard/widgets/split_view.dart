import 'package:digicard/ui/views/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'bottom_appbar_widget.dart';
import 'page_scaffold.dart';

class SplitView extends StatelessWidget {
  final int selectedIndex;
  final PageScaffold content;
  const SplitView({
    Key? key,
    required this.content,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600) {
      // wide screen: menu on the left, content on the right
      return Row(
        children: [
          SizedBox(
            width: 280,
            child: DrawerWidget(
              selectedIndex: selectedIndex,
            ),
          ),
          //   Container(width: 0.5, color: Colors.black),
          Expanded(child: content),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        body: content,
        drawer: SizedBox(
          width: 280,
          child: DrawerWidget(
            selectedIndex: selectedIndex,
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(
          selectedIndex: selectedIndex,
        ),
      );
    }
  }
}
