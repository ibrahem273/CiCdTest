import 'package:flutter/material.dart';

class ResponsiveLoaderWidget extends StatelessWidget {
  const ResponsiveLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.center, child: CircularProgressIndicator());
  }
}
