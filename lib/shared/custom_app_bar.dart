import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget actionsIcon;
  final Function()? onPressed;
  const CustomAppBar({super.key, required this.actionsIcon, this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      actions: [actionsIcon],
    );
  }
}
