import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar(
      {super.key,
      required this.title,
      required this.modeCallback,
      required this.searchCallback});

  final String title;
  final VoidCallback modeCallback;
  final VoidCallback searchCallback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: modeCallback,
            icon: const Icon(
              Icons.dark_mode_outlined,
            )),
        IconButton(
            onPressed: searchCallback,
            icon: const Icon(
              Icons.search,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
