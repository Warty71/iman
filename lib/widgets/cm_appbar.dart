import 'package:code_master/constants/app_constants.dart';
import 'package:code_master/widgets/components/icon_network.dart';
import 'package:flutter/material.dart';

class CmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CmAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        'Code Master',
        style: AppConstants.primaryFont,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const IconNetwork(),
          onPressed: () {},
        ),
      ],
    );
  }
}
