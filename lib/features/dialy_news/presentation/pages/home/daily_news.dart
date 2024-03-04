import 'package:flutter/material.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }
}

_buildAppBar() {
  return AppBar(
    title: const Text("Indonesia Tech News"),
  );
}
