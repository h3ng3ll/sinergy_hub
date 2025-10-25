import 'package:flutter/material.dart';

class BuildAttachBtn extends StatelessWidget {
  final VoidCallback onTap;

  const BuildAttachBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.add,
      ),
    );
  }
}
