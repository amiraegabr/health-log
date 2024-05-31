import 'package:flutter/material.dart';
class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 60,
      endIndent: 60,
      color: Theme.of(context).splashColor,
    );
  }
}