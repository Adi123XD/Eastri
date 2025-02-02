import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;
  const CustomAppbar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 30,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
