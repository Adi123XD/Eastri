import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onPressed;
  const CustomAppbar({super.key, required this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black)),
      centerTitle: false,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.chevron_left_rounded),
        iconSize: 35,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
