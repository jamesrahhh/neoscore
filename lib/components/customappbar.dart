import 'package:flutter/material.dart';
import 'package:neuralflight/pages/minor/account.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageName;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.pageName, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pageName,
            style: const TextStyle(color: Colors.white, fontSize: 19),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Account())),
            child: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
