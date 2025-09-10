import 'package:flutter/material.dart';

class RickAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text(
          "Rick and Morty API Consumer",
          style: TextStyle(color: Colors.white),
        ),
      ),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.rocket, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 0, 53, 100),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
