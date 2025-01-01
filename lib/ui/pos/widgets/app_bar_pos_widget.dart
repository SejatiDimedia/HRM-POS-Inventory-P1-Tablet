import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AppBarPosWidget extends StatelessWidget {
  final String title;

  const AppBarPosWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Assets.icons.settingCircle.svg(),
            ),
            const SpaceWidth(10.0),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: ClipOval(
                child: CachedNetworkImage(
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            const SpaceWidth(10.0),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Assets.icons.logoutCircle.svg(),
            ),
          ],
        ),
      ),
    );
  }
}
