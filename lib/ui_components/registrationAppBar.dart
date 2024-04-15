import 'package:flutter/material.dart';

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      // centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        SizedBox(width: 40, child: Image.asset("assets/images/logo.png")),
        const SizedBox(width: 20,),
        const Text("HEALTH LOG"),
      ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight +30);
}