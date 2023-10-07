import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final VoidCallback? onPressed;

  MenuAppBar({
      super.key,
      required this.title,
      this.actions = const [],
      this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1, // Shadow under the app bar
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      actions: actions,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
