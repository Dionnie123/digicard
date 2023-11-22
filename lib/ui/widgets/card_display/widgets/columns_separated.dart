import 'package:flutter/widgets.dart';

class ColumnSeparated extends StatelessWidget {
  final double spacing;
  final List<Widget> children;
  const ColumnSeparated(
      {super.key, required this.children, this.spacing = 15.0});

  @override
  Widget build(BuildContext context) {
    children.removeWhere((element) {
      return element is SizedBox;
    });
    for (var i = 0; i < children.length; i++) {
      if (i == 0) {}
      if (i % 2 != 0) {
        children.insert(
          i,
          SizedBox(
            height: spacing,
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: children.isEmpty ? 0 : spacing),
      child: Column(
        children: children,
      ),
    );
  }
}
