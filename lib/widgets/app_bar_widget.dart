import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistem/theme/app_theme.dart';

// ignore: must_be_immutable
class AppBarFragment extends ConsumerWidget with PreferredSizeWidget {
  AppBarFragment({
    super.key,
    this.title,
  });
  final title;
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(appTheme.backgroundColor),
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => {},
            child: Tab(
              icon: Image.asset("assets/images/image-removebg.png"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title ?? ''),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
